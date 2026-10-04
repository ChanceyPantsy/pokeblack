#!/usr/bin/env python3
"""lane S helper: print built vs original bytes at an ARM9 address"""
import sys

built = open("build/black.us/main.sbin", "rb").read()
orig = open("build/black.us/extracted/arm9_decompressed.bin", "rb").read()
addr = int(sys.argv[1], 16)
n = int(sys.argv[2], 16) if len(sys.argv) > 2 else 0x20
# built sbin has a 12-byte SDK footer at the end and starts at ROM arm9 load addr
BASE_BUILT = None
for off in range(0, 0x200, 4):
    if built[off : off + 16] == orig[0:16]:
        BASE_BUILT = off
        break
built_off = addr - 0x02000000 - (BASE_BUILT or 0)
orig_off = addr - 0x02000000
print("addr    ", hex(addr))
print("built   ", " ".join("%02x" % c for c in built[built_off : built_off + n]))
print("original", " ".join("%02x" % c for c in orig[orig_off : orig_off + n]))
