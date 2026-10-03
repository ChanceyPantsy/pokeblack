#!/usr/bin/env python3
"""Regression tests for carve_function.py.

Run with: python3 -m unittest discover -s tools/scripts/tests

These pin the two defects that blocked the second decompilation batch. Each
fails against the pre-fix script and passes after it.
"""

import os
import re
import shutil
import sys
import tempfile
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

import carve_function  # noqa: E402

# Two functions, the second followed by a 4-byte literal pool that belongs to
# no function. Carving the second must leave the pool in the module.
TAIL_POOL = """\t.include "asm/macros/function.inc"

\t.text
\tthumb_func_start FUN_02008554
FUN_02008554: ; 0x02008554
\tldrb r0, [r0, #0x1c]
\tbx lr
\tthumb_func_end FUN_02008554
_02008558:
\t.byte 0x01, 0x77, 0x70, 0x47, 0xC0, 0x7E, 0x70, 0x47

\tthumb_func_start FUN_02008560
FUN_02008560: ; 0x02008560
\tstrb r1, [r0, #0x1b]
\tbx lr
\tthumb_func_end FUN_02008560
_02008564:
\t.byte 0x80, 0x7E, 0x70, 0x47
"""

# The function being carved is the first one in its file, so the lower half is
# empty. That empty half used to keep the original file name, which collided
# with the new C object under -search.
HEAD_TAIL = """\t.include "asm/macros/function.inc"

\t.text
\tthumb_func_start FUN_0200856C
FUN_0200856C: ; 0x0200856C
\tldrb r0, [r0, #0x18]
\tbx lr
\tthumb_func_end FUN_0200856C

\tthumb_func_start FUN_02008570
FUN_02008570: ; 0x02008570
\tldrb r0, [r0, #0x19]
\tbx lr
\tthumb_func_end FUN_02008570
"""

# Three functions: the classic split-in-the-middle carve.
MIDDLE = """\t.include "asm/macros/function.inc"

\t.text
\tthumb_func_start FUN_02008548
FUN_02008548: ; 0x02008548
\tldrb r0, [r0, #0x17]
\tbx lr
\tthumb_func_end FUN_02008548

\tthumb_func_start FUN_02008554
FUN_02008554: ; 0x02008554
\tldrb r0, [r0, #0x1c]
\tbx lr
\tthumb_func_end FUN_02008554

\tthumb_func_start FUN_02008560
FUN_02008560: ; 0x02008560
\tstrb r1, [r0, #0x1b]
\tbx lr
\tthumb_func_end FUN_02008560
"""

def lsf_for(names):
    objects = [f"\tObject\t\tasm/{n}.o" for n in names]
    return ("Linker Script File\nGroup\tmain.elf\n{\n\tStatic main\n"
            + "\n".join(objects)
            + "\n\tObject\t\tsrc/unk_02008574.o\n}\n")


def read(path):
    with open(path) as fh:
        return fh.read()


def lsf_objects(text):
    return re.findall(r'^\tObject\t\t(\S+)$', text, re.M)


class CarveTestCase(unittest.TestCase):
    """Runs carve_function.main() against a throwaway tree."""

    def setUp(self):
        self.dir = tempfile.mkdtemp()
        self.addCleanup(shutil.rmtree, self.dir)
        os.mkdir(os.path.join(self.dir, 'asm'))
        self.addCleanup(os.chdir, os.getcwd())
        os.chdir(self.dir)

    def carve(self, function, obj, filename, text, others=()):
        with open(os.path.join(self.dir, 'asm', filename), 'w') as fh:
            fh.write(text)
        stem = filename[:-2]
        names = [stem] + [o[:-2] for o in others]
        with open(os.path.join(self.dir, 'main.lsf'), 'w') as fh:
            fh.write(lsf_for(names))

        argv = sys.argv
        sys.argv = ['carve_function.py', function, '--object', obj]
        try:
            rc = carve_function.main()
        finally:
            sys.argv = argv
        self.assertEqual(rc, 0)
        return lsf_objects(read(os.path.join(self.dir, 'main.lsf')))


class TestLiteralPoolPreserved(CarveTestCase):
    """Defect 1: the 4-byte literal pool after FUN_02008560 was swallowed.

    The script bounded a function at the next func_start, so everything
    between thumb_func_end and the next func_start - here the literal pool
    _02008564, which belongs to no function - was dropped from the module.
    The ARM9 came back 4 bytes short and every later address shifted.
    """

    def test_pool_survives_carve_of_last_function(self):
        objs = self.carve('FUN_02008560', 'src/unk_02008560.o',
                          'unk_02008554.s', TAIL_POOL)

        kept = read('asm/unk_02008554.s')
        self.assertIn('FUN_02008554:', kept)
        self.assertNotIn('FUN_02008560:', kept)
        self.assertNotIn('_02008564:', kept)

        # the pool sat after the carved function, so it belongs to the upper
        # half; what matters is that it survives somewhere
        pool = read('asm/unk_02008564.s')
        self.assertIn('0x80, 0x7E, 0x70, 0x47', pool)
        self.assertNotIn('FUN_02008560:', pool)
        # gen_force_active.py anchors an object by a global symbol; a pool has
        # no func_start, so without this the linker relocates it
        self.assertIn('\t.global _02008564', pool)
        self.assertEqual(objs, [
            'asm/unk_02008554.o',
            'src/unk_02008560.o',
            'asm/unk_02008564.o',
            'src/unk_02008574.o',
        ])

    def test_pool_survives_carve_of_first_function(self):
        objs = self.carve('FUN_02008554', 'src/unk_02008554.o',
                          'unk_02008554.s', TAIL_POOL)

        # the empty lower half is dropped; the rest keeps the old file name
        upper = read('asm/unk_02008560.s')
        self.assertIn('_02008564:', upper)
        self.assertIn('0x80, 0x7E, 0x70, 0x47', upper)
        self.assertIn('FUN_02008560:', upper)
        self.assertFalse(os.path.exists('asm/unk_02008554.s'))
        self.assertEqual(objs, [
            'src/unk_02008554.o',
            'asm/unk_02008560.o',
            'src/unk_02008574.o',
        ])


class TestObjectNameCollision(CarveTestCase):
    """Defect 2: carving the file's first function left a 0-line lower half.

    That empty half kept the original file name, so asm/unk_0200856C.o and
    src/unk_0200856C.o existed at once and -search made the linker abort with
    'Symbol FUN_0200856C multiply defined'.
    """

    def test_no_duplicate_object_basename(self):
        objs = self.carve('FUN_0200856C', 'src/unk_0200856C.o',
                          'unk_0200856C.s', HEAD_TAIL)

        names = [os.path.basename(o) for o in objs]
        self.assertEqual(len(names), len(set(names)), f"duplicate objects: {objs}")
        self.assertEqual(objs, [
            'src/unk_0200856C.o',
            'asm/unk_02008570.o',
            'src/unk_02008574.o',
        ])

    def test_stale_file_is_removed(self):
        self.carve('FUN_0200856C', 'src/unk_0200856C.o',
                   'unk_0200856C.s', HEAD_TAIL)

        # the emptied source file must not linger and get picked up by the
        # wildcard in common.mk
        self.assertFalse(os.path.exists('asm/unk_0200856C.s'))
        self.assertIn('FUN_02008570:', read('asm/unk_02008570.s'))


class TestSplitInTheMiddle(CarveTestCase):
    """The ordinary case must keep behaving as it did."""

    def test_both_halves_get_an_object(self):
        objs = self.carve('FUN_02008554', 'src/unk_02008554.o',
                          'unk_02008548.s', MIDDLE)

        self.assertEqual(objs, [
            'asm/unk_02008548.o',
            'src/unk_02008554.o',
            'asm/unk_02008560.o',
            'src/unk_02008574.o',
        ])

    def test_code_lands_on_the_right_side(self):
        self.carve('FUN_02008554', 'src/unk_02008554.o',
                   'unk_02008548.s', MIDDLE)

        lower = read('asm/unk_02008548.s')
        upper = read('asm/unk_02008560.s')
        self.assertIn('FUN_02008548:', lower)
        self.assertNotIn('FUN_02008560:', lower)
        self.assertIn('FUN_02008560:', upper)
        self.assertNotIn('FUN_02008548:', upper)


if __name__ == '__main__':
    unittest.main()