#!/usr/bin/env python3
"""compare a byte window of the built sbin against the original arm9"""
import sys

ORIG = 'build/black.us/extracted/arm9_decompressed.bin'
BUILT = 'build/black.us/main.sbin'
BASE = 0x02004000


def main():
    start = int(sys.argv[1], 16)
    length = int(sys.argv[2], 16)
    o = open(ORIG, 'rb').read()[start - BASE:start - BASE + length]
    b = open(BUILT, 'rb').read()[start - BASE:start - BASE + length]
    print('orig :', o.hex(' '))
    print('built:', b.hex(' '))
    print('match:', o == b)


main()