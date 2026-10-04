#!/usr/bin/env python3
"""print raw bytes from the decompressed ARM9 at a given address"""
import sys

BASE = 0x02004000
data = open('build/black.us/extracted/arm9_decompressed.bin', 'rb').read()

start = int(sys.argv[1], 16)
count = int(sys.argv[2], 0) if len(sys.argv) > 2 else 32
off = start - BASE
for i in range(0, count, 16):
    chunk = data[off + i:off + i + 16]
    print('%08X  %s' % (start + i, ' '.join('%02X' % b for b in chunk)))
