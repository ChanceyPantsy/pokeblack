#!/usr/bin/env python3
"""dump the original ARM9 bytes for an address range (compare against objdump)"""

import sys

BASE = 0x02000000


def main():
    start = int(sys.argv[1], 16)
    end = int(sys.argv[2], 16)
    data = open('build/black.us/extracted/arm9_decompressed.bin', 'rb').read()
    seg = data[start - BASE:end - BASE]
    for i in range(0, len(seg), 2):
        print(f"{start + i:#010x}  {seg[i:i + 2].hex()}")


if __name__ == '__main__':
    main()