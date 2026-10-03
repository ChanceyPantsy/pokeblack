import sys
d = open('build/black.us/extracted/arm9_decompressed.bin', 'rb').read()
LOAD = 0x02004000
start = int(sys.argv[1], 16) - LOAD
print(' '.join(f'{b:02x}' for b in d[start:start + int(sys.argv[2])]))