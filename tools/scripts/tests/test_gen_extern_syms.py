#!/usr/bin/env python3
"""Regression tests for gen_extern_syms.py.

Run with: python3 -m unittest discover -s tools/scripts/tests

These pin the defect where any `name(` in a linked C file counted as a
definition, so a *call* to an assembly-only symbol suppressed the LCF address
that call needed. Each fails against the pre-fix script.
"""

import os
import sys
import tempfile
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

import gen_extern_syms  # noqa: E402

# The symbol is .extern in asm and defined nowhere in it, so it needs an LCF
# address entry.
ASM = """\t.include "asm/macros/function.inc"

\t.extern FUN_0216736C

\t.text
\tthumb_func_start FUN_0200E488
FUN_0200E488: ; 0x0200E488
\tpush {r4, lr}
\tbl FUN_0216736C
\tpop {r4, pc}
\tthumb_func_end FUN_0200E488
"""

# A C translation unit that *defines* its own function and *calls* the
# assembly-only one.
CALLS_ONLY = """#include "unk_0200E488.h"
#include "unk_0216736C.h"

u32 FUN_0200E488(u32 index, u32 count) {
    return FUN_0216736C(index, count);
}
"""

DEFINES = """#include "unk_0200E488.h"

u32 FUN_0200E488(u32 index, u32 count) {
    return index + count;
}
"""


class ExternSymsTest(unittest.TestCase):
    def run_gen(self, asm, c_text):
        tmp = tempfile.mkdtemp()
        asm_path = os.path.join(tmp, 'unk_test.s')
        c_path = os.path.join(tmp, 'test.c')
        out = os.path.join(tmp, 'extern_syms.lcf')
        with open(asm_path, 'w') as handle:
            handle.write(asm)
        with open(c_path, 'w') as handle:
            handle.write(c_text)
        argv = sys.argv
        sys.argv = ['gen_extern_syms.py', asm_path, '--provided', c_path, '-o', out]
        try:
            gen_extern_syms.main()
        finally:
            sys.argv = argv
        return open(out).read()

    def test_call_from_c_still_gets_an_address(self):
        # the defect: FUN_0216736C( looks like a definition, so it is dropped
        # from the LCF and the link fails with Undefined: "FUN_0216736C"
        text = self.run_gen(ASM, CALLS_ONLY)
        self.assertIn('FUN_0216736C = 0x0216736C;', text)

    def test_definition_from_c_is_not_defined_twice(self):
        # a C definition is resolved by the linker, so it must not also get an
        # absolute LCF symbol
        text = self.run_gen(ASM, DEFINES)
        self.assertNotIn('FUN_0200E488 =', text)


if __name__ == '__main__':
    unittest.main()