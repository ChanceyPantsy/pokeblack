#!/usr/bin/env python3
"""show built vs original bytes around the first differences"""
import sys

LOAD = 0x02004000
built = open(sys.argv[1], 'rb').read()
orig = open(sys.argv[2], 'rb').read()

n = min(len(built), len(orig))
first = [i for i in range(n) if built[i] != orig[i]]
if not first:
    print('identical')
    raise SystemExit

start = first[0]
lo = max(0, start - 32)
hi = start + 48
print('first diff at 0x%08X' % (LOAD + start))
for base, blob, tag in ((lo, built, 'built'), (lo, orig, 'orig')):
    print('%-5s 0x%08X  %s' % (tag, LOAD + base,
          ' '.join('%02X' % b for b in blob[base:hi])))
