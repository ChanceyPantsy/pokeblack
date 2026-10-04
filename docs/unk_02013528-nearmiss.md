# FUN_02013528 — near-miss conversion (NOT matching)

Status: **not committed to `src/`**; the build stays MATCHing with this in asm.
Work preserved here after hitting the CodeWarrior scheduling wall.

## Root cause of the earlier "asm split breaks the binary" report

The split of `asm/unk_02013360.s` at 0x02013528 is **sound on its own** — with
`asm/unk_02013528.s` + one `main.lsf` line added, `make compare-arm9` MATCHes
(commit 21f0f67). The global byte-shift that blocked the previous run was a
single mistyped literal while transcribing the tail bytes:

    .byte ... 0x31, 0x1C, 0x00, 0x22   <- wrong
    .byte ... 0x31, 0x1C, 0x01, 0x22   <- correct (in _02013734 region)

One wrong byte in a raw-data blob shifts everything downstream, which is what
produced "522 KB of diffs, first mismatch at 0x02004980". There is no
`.balign`/lsf problem. Always `diff` a hand-copied tail against git before
building.

## How to convert it

Two objects are required, in this order:

    Object asm/unk_02013360.o
    Object asm/unk_02013528.s   -> src/unk_02013528.c   (0x02013528, 0x98 bytes)
    Object asm/unk_020135C0.s   (0x020135C0..0x02013980, 0x3c0 bytes)

Pointing the 0x02013528 slot straight at `src/` without also carving out the
`_020135C0` tail silently drops those 960 bytes (build comes up exactly 960
short — the tail is only reachable as the continuation of the same object).

## What the C must look like

Prototype has 8 args (`sp+0x34` load ⇒ 5th+ stack arg; frame 0x14 ⇒ 5 locals):

    void FUN_02013528(UNK_02013528 *arg1, void *arg2, void *arg3, u8 arg4,
                      u32 arg5, u32 arg6, u32 arg7, void *arg8);

- local frame must be exactly `u32 stack[5]` (0x14). `stack[2]` shrinks it to
  12 and `stack[5]` grows it to 24 — both change the `ldr r6,[sp,#0x34]`
  displacement.
- the loop guard is `if (i != 0)`, not a plain `for` — the original does
  `cmp r4,#0; beq <next>` and skips index 0 entirely.
- `arg1->unk_34[i]` is checked/filled **before** `arg1->unk_24[i]`
  (`FUN_0200846C` then `FUN_0201A920`).

## Remaining single diff

`.text` is byte-for-byte 0x98 and matches the original exactly except for one
4-byte instruction *ordering* in the prologue:

    original: push {r4,r5,r6,r7,lr} / sub sp,#0x14 / str r3,[sp] / add r7.. / ldr r6,[sp,#0x34]
    built:    push {r4,r5,r6,r7,lr} / sub sp,#0x14 / add r7.. / ldr r6,[sp,#0x34] / str r3,[sp]

The spill of `arg4` has to be scheduled *before* the argument shuffles.
Attempts that did not work:

- `stack[0] = arg4;` as the first statement — still sunk after the shuffles.
- routing through a separate `u32 keep` — fixes the order but changes the
  prologue to `push {r3,r4,r5,r6,r7,lr}` and the frame to 24.
- `volatile u32 stack[5]` — does not compile (`volatile u32 *` to `u32 *`).

This is CodeWarrior register-allocation scheduling, not something reachable by
reordering C statements. Worth another attempt only with a different local
layout (e.g. declaring `stack[0]` separately from `stack[1..4]`).