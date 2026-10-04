#!/usr/bin/env python3
"""lane S helper: emit header + source for a simple field accessor conversion"""
import sys

# FUN -> (return type, byte offset)
ACCESSORS = {
    "FUN_02012924": ("void *", 0x63 * 4),
    "FUN_0201292C": ("void *", 0x19 * 16),
    "FUN_02012934": ("void *", 0x65 * 4),
    "FUN_0201295C": ("void *", 0x69 * 4),
    "FUN_02012964": ("void *", 0x6A * 4),
    "FUN_0201296C": ("void *", 0x6B * 4),
    "FUN_02012A24": ("u8", 0x1C9),
    "FUN_02012A30": ("void *", 0x6D * 4),
}

names = sys.argv[1:]
add = []
for f in names:
    ret, off = ACCESSORS[f]
    base = "unk_" + f[4:]
    with open(f"include/{base}.h", "w") as fh:
        fh.write(
            f"#ifndef {f}_H\n#define {f}_H\n\n#include \"types.h\"\n\n"
            f"{ret} {f}(void *obj);\n\n#endif\n"
        )
    if ret == "void *":
        expr = f"(void *)(*(u32 *)((u8 *)obj + 0x{off:X}))"
    else:
        expr = f"*((u8 *)obj + 0x{off:X})"
    with open(f"src/{base}.c", "w") as fh:
        fh.write(f'#include "{base}.h"\n\n{ret} {f}(void *obj) {{\n    return {expr};\n}}\n')
    add.append(base + ".c")

mk = open("Makefile").read()
mk = mk.replace("LINKED_C_SRCS  := ", "LINKED_C_SRCS  := " + " ".join(add) + " ", 1)
open("Makefile", "w").write(mk)
print("wrote", " ".join(add))
