#!/usr/bin/env python3
"""locate a byte pattern in the decompressed ARM9"""
import sys

data = open('build/black.us/extracted/arm9_decompressed.bin', 'rb').read()
pat = bytes(int(x, 16) for x in sys.argv[1].split())
base = int(sys.argv[2], 16) if len(sys.argv) > 2 else 0x02004000

i = data.find(pat)
while i != -1:
    print('0x%08X' % (base + i))
    i = data.find(pat, i + 1)
