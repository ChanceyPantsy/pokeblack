# pokeblack AI-assisted decompilation audit (bootstrap)

**Provenance note — read this first.** This document was written by an LLM agent
(OpenRouter `stealth/space-bunny-alpha`) operating in the user's personal fork
`ChanceyPantsy/pokeblack` on branch `ai/space-bunny-bootstrap`. Per pokeblack's
CONTRIBUTING.md AI Policy, **nothing produced under this branch may be submitted
upstream**, and this work must not be represented as human-authored reverse
engineering. The branch exists to give a human collaborator a durable, accurate
starting point; attribution stays attached.

This file is a *plan and inventory only*. No assembly was carved, no disassembly
was edited, and no C was added. That is deliberate: see "Baseline build status".

## 1. Repository audit

| Fact | Value |
| --- | --- |
| Fork remote | `https://github.com/ChanceyPantsy/pokeblack.git` (origin) |
| Branch audited | `main` @ `84e6b56` ("Update README.md") |
| Upstream lineage | mirrors `squiddonaut/pokeblack`; last content-affecting upstream commits are `53b3e9d` (battle_record.c matching decomp) and `51c5447` |
| Target ROM | Pokémon Black US/EUR NDSi-Enhanced v1.0, sha1 `26ad0b9967aa279c4a266ee69f52b9b2332399a5`, 268,435,456 bytes |
| Compiler | Metrowerks CodeWarrior `dsi/1.1` (`mwccarm.exe` / `mwasmarm.exe` / `mwldarm.exe`), driven through Wine on Linux |
| SDK | TWL-SDK 5.3 patch 1, only 4 files read from it |
| ARM9 size | 681,920 bytes decompressed; `make compare-arm9` is the byte-for-byte gate |
| Functions available | ~29,034 dumped; `ndsdisasm_config/arm9_config.cfg` still names 1,279 of 1,309 as `FUN_<address>` |
| Overlays | 237 |
| C already matching | 2 translation units: `src/unk_02008574.c`, `src/battle_record.c` |
| Non-matching assembly kept | `asm/nonmatchings/battle_record_restorestart.s` |
| Tooling | `tools/scripts/carve_function.py` (carving + `main.lsf` rewriting), `tools/asm_processor` (GLOBAL_ASM), `test/toolchain_canary.c` (frozen toolchain hash), `tools/scripts/find_holes.py` (code/data separation) |

Build entry points: `make check-toolchain`, `make`, `make compare`,
`make compare-arm9`, `make compare-all`. Hash checking is on by default; do not
disable it with `COMPARE=0`.

### Baseline build status (blocking prerequisite)

On the machine this audit was written on:

- `tools/mwccarm/dsi/1.1/` contains **only wrapper scripts** — no `mwccarm.exe`,
  `mwasmarm.exe`, `mwldarm.exe`. Only `tools/mwasmarm_patcher/mwasmarm_patcher.exe`
  ships in-tree.
- `lib/` contains only `syscall/`; there is no `lib/NitroSDK/TwlSDK`.
- `arm-none-eabi-objcopy` is not installed.
- `baserom.nds` is absent (expected — it is gitignored; only the granular
  `extract`/`compare-overlays`/`compare-table`/`compare-arm7` targets need it).

Consequence: **a matching baseline cannot currently be built here**, so no carve
or C addition was attempted. INSTALL.md steps 1–3 (and 5 for the granular
compare targets) must be completed first. Once `make compare-arm9` prints
`MATCH`, this backlog is unblocked.

## 2. Verification workflow

Run from the repository root, in this order:

```bash
make check-toolchain     # frozen canary: compiler emits the expected bytes
make                     # builds build/black.us/poke*.nds, COMPARE=1 by default
make compare-arm9        # must print MATCH (681,920 bytes)
make compare             # same build with every recorded hash checked
make compare-all         # adds overlays, arm7, overlay table, file manifests
```

Per-function loop for one decompiled function:

```bash
python3 tools/scripts/carve_function.py <FUN> --object src/<file>.o --dry-run
python3 tools/scripts/carve_function.py <FUN> --object src/<file>.o
# add the .c to LINKED_C_SRCS in Makefile
make && make compare-arm9
```

Rules that must not be bent:

- Every source file includes its own header of the same name, and that header
  declares what the file defines. `MWCFLAGS` passes `-W error`, so a missing
  prototype is a build failure, not a warning.
- `MWCFLAGS` passes `-thumb`. Compiling ARM produces 4-byte instructions where
  the original has 2.
- Never "fix" a mismatch with `COMPARE=0`. If a function resists matching, keep
  it as assembly via `GLOBAL_ASM` (Metrowerks mnemonics, e.g. `lsl`; blocks of
  at least three Thumb instructions; `asm_processor` strips `-sym on` for those
  compiles).
- Renames go in their own commit, and must land in both the assembly and the
  matching `ndsdisasm_config/*.cfg` entry.
- Leave `ndsdisasm_config/` alone unless the symbol rename is part of the change.

## 3. First-carve backlog

All candidates below live in one contiguous run, `asm/unk_02008468.s`
(148 lines, addresses 0x02008468–0x02008574). They are struct accessors on the
same ~0x20/0x34-byte object that `FUN_02008574` (already in `src/`) pokes at
offsets 0x18/0x19 — the accessor family is the natural companion to the one
function already decompiled here.

Common traits that make them low-risk first conversions:

- Leaf functions: no calls, no loops, no branches except the return.
- Return value is a plain `ldr`/`ldrb`/`mov` of a constant or a struct field.
- No PC-relative data references inside them, so nothing crosses an object
  boundary at carve time. `carve_function.py --dry-run` accepts all of them
  (verified; see the split sizes below).
- Heavily called, so a mistake shows up loudly at the first `compare-arm9` rather
  than hiding — the failure mode is a byte diff, not a subtle semantic drift.

### Candidate A — `FUN_02008530` (field read, 32-bit)

- Address: 0x02008530, in `asm/unk_02008468.s`, body `ldr r0, [r0, #0x10]; bx lr`.
- Suggested C: `u32 FUN_02008530(void *obj) { return *(u32 *)((u8 *)obj + 0x10); }`
  — exact return type is a guess; the original may be a pointer or a `u32`
  field. Check the struct in `asm/unk_02008468.s` context before fixing a type.
- Callers: 25 files, e.g. `asm/overlay_135_021F4580.s`, `asm/overlay_099_021B95A0.s`,
  `asm/unk_0201FC1C.s`, `asm/unk_0200F150.s`, `asm/unk_0200D3A4.s`.
- Dry-run carve: file 78 lines before, 55 lines after → new `asm/unk_02008534.s`.
- Risk: none beyond picking the return type. Strong first candidate.

### Candidate B — `FUN_02008534` (field read, 16-bit truncated)

- Address: 0x02008534, body `ldr r0, [r0, #0x10]; lsl r0, #16; lsr r0, #16; bx lr`.
- Reads the same 0x10 field as A and truncates to `u16`, i.e. `return *(u16 *)(obj + 0x10);`
  in C. The `lsl/lsr` pair is exactly how MWCC truncates a load to `u16`.
- Callers: 6 files, incl. `asm/unk_0201FC1C.s`, `asm/overlay_107_021EE740.s`,
  `asm/overlay_137_021DC860.s`.
- Dry-run carve: 84 before, 47 after → new `asm/unk_0200853C.s`.
- Note: because the original was likely a `u16` load, check whether MWCC emits
  `ldrh` (which the disassembler would have printed) — it did not, so the C must
  be a `u32`-typed field narrowed by assignment, e.g. `return (u16)*(u32 *)...;`
  Verify against the emitted bytes rather than guessing.

### Candidate C — `FUN_02008550` (field read, `u8`, at 0x1D)

- Address: 0x02008550, body `ldrb r0, [r0, #0x1d]; bx lr`.
- Callers: `asm/overlay_135_021F4580.s` (lines 849, 7525), `asm/unk_0201FC1C.s` (line 9300).
- Dry-run carve: 100 before, 33 after → new `asm/unk_02008554.s`.
- Sibling of the already-decompiled `FUN_02008574` setter pair; a natural
  companion commit.

### Candidate D — `FUN_02008560` (field write, `u8`, at 0x1B)

- Address: 0x02008560, body `strb r1, [r0, #0x1b]; bx lr`.
- Suggested C: `void FUN_02008560(void *obj, u8 v) { *(u8 *)((u8 *)obj + 0x1B) = v; }`
- Called from `FUN_020084A0` inside `asm/unk_02008468.s` itself (`mov r1, #0x15; bl FUN_02008560`)
  and from `asm/overlay_135_021F4580.s` line 5458.
- Dry-run carve: 114 before, 17 after → new `asm/unk_02008568.s`.
- Risk: the in-file caller `FUN_020084A0` stays in assembly and calls the new C
  object via `bl`, which is relocatable across objects — the exact case the
  contributor docs say carves must allow.

### Candidate E — `FUN_02008568` / `FUN_0200856C` / `FUN_02008570` (write/read pair trio)

- Addresses 0x02008568 (`strb r1, [r0, #0x1a]`), 0x0200856C (`ldrb r0, [r0, #0x18]`),
  0x02008570 (`ldrb r0, [r0, #0x19]`) — the accessors matching `FUN_02008574`'s
  two stores exactly.
- 0x0200856C and 0x02008570 have 12 and 13 caller files respectively
  (`asm/unk_0201FC1C.s`, `asm/overlay_120_021D4240.s`, `asm/overlay_177_021E5440.s`, …).
- Dry-run carves, all accepted: 0x02008568 → new `asm/unk_0200856C.s` (122 before,
  11 after); 0x0200856C → new `asm/unk_02008570.s` (128 before, 5 after);
  0x02008570 leaves a 0-line lower half (134 before, 0 after, written as
  `asm/unk_02008468_b.s`) — check how the script names an empty tail before
  taking this one, since a zero-line assembly object is a different edge case
  than the other candidates.

### Not recommended as first work

- `FUN_02008500` — a tail-call thunk (`bx` through a loaded address with register
  shuffling). Fine later as a one-liner, but the reorder-around-`bx` is a bad
  first lesson in what makes MWCC codegen match. Dry-run accepts it (64 before,
  61 after → `asm/unk_02008530.s`).
- `FUN_0200846C` — has `lsl/lsr` pair, a stack word, a `blx` to `Heap_AllocDebug`
  and a call to `FUN_020084A0`. Good second target once accessors are routine,
  not a first one.
- Anything in `asm/battle_*.s` — those files are grouped aggregates, so a carve
  splits a large object and the surrounding layout is harder to reason about.

## 4. Suggested order of work

1. Obtain the CodeWarrior drop, TWL-SDK 5.3, and arm-none-eabi binutils
   (INSTALL.md steps 1–3). `baserom.nds` is only needed for the granular
   `extract`/`compare-*` targets, not for `make`/`make compare`.
2. Get `make check-toolchain` and `make compare-arm9` printing `MATCH`. Record
   the exact commit that reproduces; that is the baseline this backlog is only
   valid against.
3. Convert Candidate A (`FUN_02008530`) in its own commit. Verify.
4. Convert C, D, then the E trio, each in its own commit, each verified with
   `make && make compare-arm9` before moving on.
5. Only then consider the thunk and the allocator call sites.
6. Keep renames separate from decompilation, and update
   `ndsdisasm_config/arm9_config.cfg` in the same commit as any rename
   (`FUN_02008568` is at `ndsdisasm_config/arm9_config.cfg:152`).

## 4a. First batch — results (branch `ai/space-bunny-first-batch`)

Done on top of commit `85c6b40` with the toolchain installed. Baseline at
`85c6b40` was `make compare-arm9` MATCH (681,920 bytes, 12-byte SDK trailer).
Each conversion below was built and verified individually with compare checking
left on.

| Function | Commit | C | Verified |
| --- | --- | --- | --- |
| `FUN_02008530` | `fdaec31` | `u32 (*(u32 *)((u8 *)obj + 0x10))` | `compare-arm9` MATCH, `ROM matches` |
| `FUN_02008550` | `aa48047` | `((u8 *)obj)[0x1D]` | `compare-arm9` MATCH, `ROM matches` |
| `FUN_02008568` | `6478e5d` | `((u8 *)obj)[0x1A] = value` | `compare-arm9` MATCH, `ROM matches` |

Final state: `make check-toolchain` OK, `make compare-arm9` MATCH, `make compare`
→ `ROM matches black.us/rom.sha1`.

### Two carve limitations hit, and how they were handled

- **Candidate D (`FUN_02008560`) reverted.** `carve_function.py` bounds a function
  at the next `func_start`, so it swallowed the 4-byte data pool `_02008564`
  that sits between `FUN_02008560` and `FUN_02008568`. The 681,920-byte ARM9 came
  back 4 bytes short, which shifted every following address; the diff showed
  69,697 runs / 565,106 bytes differing, with the first divergence at 0x02004980
  — far before the carve site, which is the tell for a size change rather than a
  codegen difference. Reverted cleanly. `FUN_02008560` is still a valid
  candidate, but it needs the pool preserved, which is a fix to the script.
- **Candidate `FUN_0200856C` reverted.** Carving it produces a lower half named
  `asm/unk_0200856C.s`, whose object collides with `src/unk_0200856C.o` under
  `-search`; the linker aborts with `Symbol FUN_0200856C multiply defined`. Also
  a script limitation, not a codegen one.

Both were worth reporting upstream as script bugs, and both are now fixed on
`ai/space-bunny-second-batch` — see section 4b.

## 4b. Second batch — results (branch `ai/space-bunny-second-batch`)

Done on top of `177d9fe`. Both former blockers were tooling bugs and were
repaired before any conversion; five functions converted, each in its own
commit, each verified individually with `make compare-arm9` MATCH.

### Script repairs, with regression tests

`tools/scripts/tests/test_carve_function.py` (7 cases, stdlib `unittest`, run
with `python3 -m unittest discover -s tools/scripts/tests`) pins all of these;
each test fails against the pre-fix script.

| Defect | Fix | Commit |
| --- | --- | --- |
| Function bounded at the next `func_start`, swallowing the literal pool between `thumb_func_end` and it | bound on the function's own `func_end`; a data-only tail is named after its first label | `e2155eb` |
| Carving a file's first function left a 0-line lower half whose object collided with the new C object under `-search` | an empty half is dropped, and its `main.lsf` slot reused | `e2155eb` |
| A bare literal pool object has no `func_start`, so `gen_force_active.py` had no symbol to anchor it and the linker relocated it | emit a `.global` on the tail's first label | `e2155eb` |
| Carving the only function in a file still wrote an empty `asm/<name>_b.s` | drop the file entirely when both halves are empty | `d6ac59d` |

A separate cleanup was needed: `asm/unk_02008568.s` was left behind by the first
batch. It was never listed in `main.lsf`, so it never linked, but it duplicated
`FUN_02008568` (now C), `FUN_0200856C` and `FUN_02008570`, and
`carve_function.py` located functions in it instead of `asm/unk_0200856C.s`.
Removed in `f5e3a51`.

### Conversions

| Function | Commit | C | Verified |
| --- | --- | --- | --- |
| `FUN_02008560` | `94821bb` | `((u8 *)obj)[0x1B] = value` | `compare-arm9` MATCH, `ROM matches` |
| `FUN_0200856C` | `f094949` | `((u8 *)obj)[0x18]` | `compare-arm9` MATCH, `ROM matches` |
| `FUN_02008570` | `ce2a791` | `((u8 *)obj)[0x19]` | `compare-arm9` MATCH, `ROM matches` |
| `FUN_02008554` | `0a13120` | `((u8 *)obj)[0x1C]` | `compare-arm9` MATCH, `ROM matches` |
| `FUN_0200853C` | `d0932a2` | `*(u32 *)((u8 *)obj + 0x14)` | `compare-arm9` MATCH, `ROM matches` |

Final state: `make check-toolchain` OK, `make compare-arm9` MATCH, `make compare`
→ `main.sbin`, `arm7.sbin` and `ROM` all match, 7 carve tests pass.

## 4c. Third batch — results (branch `ai/space-bunny-third-batch`)

Done on top of `284fa30`. Baseline re-verified first: `make check-toolchain` OK,
`make compare-arm9` MATCH (681,920 bytes + 12-byte SDK trailer), 7/7 carve
tests OK, `make compare` byte-identical. Six functions converted, each in its
own commit, each verified individually with `make compare-arm9` MATCH.

| Function | C | Verified |
| --- | --- | --- |
| `FUN_02008534` | `(u16)(*(u32 *)((u8 *)obj + 0x10))` | MATCH, `ROM matches` |
| `FUN_0200864C` | `*(u16 *)obj` | MATCH, `ROM matches` |
| `FUN_02008650` | `*(u8 *)((u8 *)obj + 2)` | MATCH, `ROM matches` |
| `FUN_02008844` | empty body (`bx lr`) | MATCH, `ROM matches` |
| `FUN_02008848` | `(u8 *)obj + 0x38` | MATCH, `ROM matches` |
| `FUN_0200884C` | `(u8 *)obj + 0x54` | MATCH, `ROM matches` |

Selection was driven by the units adjacent to the first two batches: the
remaining `asm/unk_02008468.s` run, the two accessor tails of
`asm/unk_0200857C.s`, and the three-object-offset getters at the end of
`asm/unk_02008658.s`. All six are leaves with no calls, no branches and no
PC-relative data, so each carve was accepted by `--dry-run` and each function
has multiple caller files — a codegen mistake surfaces immediately as a byte
diff rather than silent semantic drift. Return and parameter types stay
provisional (`void *obj` in, a scalar or `void *` out) because the underlying
structs are still unnamed; no symbol was renamed.

Remaining known-hard cases: `FUN_0200846C` (stack frame + `Heap_AllocDebug`)
and `FUN_02008500` (register-shuffling tail-call thunk).

## 4b. Fourth matching-C batch (`ai/space-bunny-fourth-batch`)

Continued from the third batch at `cc99106`. Baseline re-verified before any
edit: `check-toolchain` OK, 7/7 carve regression tests OK, `make compare`
byte-identical ROM. The next adjacent unit was the accessor cluster at
`0x02008730`–`0x020087E8`, all of which route through `FUN_020071CC(obj, 0x1b)`
(a sub-structure getter) and then apply a fixed or indexed field offset.

| Function | C | Verified |
| --- | --- | --- |
| `FUN_02008730` | `(u8 *)FUN_020071CC(obj, 0x1b) + 4` | MATCH, `ROM matches` |
| `FUN_02008748` | `(u8 *)FUN_020071CC(obj, 0x1b) + 0x24` | MATCH, `ROM matches` |
| `FUN_02008754` | `*(u8 *)((u8 *)FUN_020071CC(obj, 0x1b) + 0x2c)` | MATCH, `ROM matches` |
| `FUN_02008764` | `*(u8 *)((u8 *)FUN_020071CC(obj, 0x1b) + 0x2c) = 1` | MATCH, `ROM matches` |
| `FUN_02008774` | `*(u8 *)((u8 *)FUN_020071CC(obj, 0x1b) + 0x2c) = 0` | MATCH, `ROM matches` |
| `FUN_02008784` | `*(u16 *)(... + index * 2 + 0x30) == 0xC21E` | MATCH, `ROM matches` |
| `FUN_020087A8` | `*(u16 *)(... + index * 2 + 0x30) = 0xC21E` | MATCH, `ROM matches` |
| `thunk_FUN_02008216` | `(u8 *)FUN_020071CC(obj, 0x1b) + 0x44 + index * 4` | MATCH, `ROM matches` |

One commit per conversion; `compare-arm9` MATCH after every commit. No symbol
was renamed and no struct was introduced — the only new header is
`include/unk_020071CC.h`, a declaration for the still-unnamed sub-structure
getter. `FUN_0200873c` (a pure tail-call thunk to `FUN_020071CC`) and the two
16-byte block copies `FUN_020087E8` / `FUN_02008808` were left in assembly:
the former matches no plausible C, and the latter need a struct view this
batch deliberately did not invent.

### Fifth batch (0x02008850–0x02008964 helper cluster)

Continued into the next assembly unit, `asm/unk_02008850.s`. Nine more leaf
helpers converted, one commit each, `compare-arm9` MATCH after every one.

| Function | C | Verified |
| --- | --- | --- |
| `FUN_02008850` | `(u8 *)obj + 0x70` | MATCH, `ROM matches` |
| `FUN_02008854` | `FUN_020071CC(obj, 0x1c)` | MATCH, `ROM matches` |
| `FUN_0200894C` | `*(u8 *)((u8 *)obj + 0x73) = value` | MATCH, `ROM matches` |
| `FUN_02008954` | `*out = *(u8 *)((u8 *)obj + 0x73)` | MATCH, `ROM matches` |
| `FUN_0200895C` | `*(u8 *)((u8 *)obj + 0x74) = value` | MATCH, `ROM matches` |
| `FUN_02008964` | `*out = *(u8 *)((u8 *)obj + 0x74)` | MATCH, `ROM matches` |
| `FUN_0200892C` | `*(u8 *)((u8 *)obj + 0x72) = FUN_02014468(arg1)` | MATCH, `ROM matches` |
| `FUN_0200893C` | `FUN_02014464(arg1, *(u8 *)((u8 *)obj + 0x72))` | MATCH, `ROM matches` |
| `FUN_02008b14` | `(u8 *)FUN_020071CC(obj, 0x25) + 0x10` | MATCH, `ROM matches` |

Three new headers declare the still-unnamed externals the two `0x72`-field
helpers call: `include/unk_02014464.h`, `include/unk_02014468.h`. Still no
renames and no invented struct. `FUN_02008860` / `FUN_020088B8` (whole-field
block copies between a sub-structure and a caller buffer) and the
`FUN_02008c2c`–`FUN_02008eb8` bank (`blx`-calling, register-shuffling window
helpers) were left in assembly: the first pair need a struct view this batch
declines to invent, and the second do not reduce to plausible C without the
same.

### Parallel lane B — seventh batch (`ai/space-bunny-parallel-b`)

Continued into `asm/unk_0200A480.s` from the fifth-batch tip (`e16fb0f`). Baseline
re-verified first: `make check-toolchain` OK, 7/7 carve regression tests OK,
`make compare-arm9` MATCH, `make compare` byte-identical. Seven functions
converted, one commit each, `compare-arm9` MATCH after every one.

| Function | C | Verified |
| --- | --- | --- |
| `FUN_0200a638` | `return 1` | MATCH, `ROM matches` |
| `FUN_0200A5F8` | `FUN_020071CC(obj, 0x2a)` | MATCH, `ROM matches` |
| `FUN_0200A7EC` | `((u8 *)obj)[0x29E] = value` | MATCH, `ROM matches` |
| `FUN_0200A864` | `FUN_020071CC(obj, 0x2b)` | MATCH, `ROM matches` |
| `FUN_0200A870` | `MI_CpuCopy8(arg1, arg0, 0x1E8)` | MATCH, `ROM matches` |
| `FUN_0200A884` | `MI_CpuCopy8(src, dest, 0x1E8)` | MATCH, `ROM matches` |
| `FUN_0200ad7c` | `FUN_02082AC0(0, dest, 0xF8)` | MATCH, `ROM matches` |

One new header, `include/unk_02082AC0.h`, declares the SDK memset under the
address this disassembly knows it by. Its parameter order is
`(data, dest, size)` — byte first, destination second — which is not the order
`include/mi_memory.h` declares `MI_CpuFill8` in, and that difference is exactly
what the `FUN_0200ad7c` thunk's `add r1, r0, #0` encodes. Declaring it with the
`mi_memory.h` order produced a 2-byte-shorter object and a whole-ROM shift; the
header comment records the order so the next lane does not repeat it.

### A carve candidate that is not a candidate: `FUN_0200a5a4`

`FUN_0200a5a4` is declared with `arm_func_start`/`arm_func_end` and an **empty
body**; the bytes that follow `_0200A5A4:` belong to the next function. The
carve accepted it, but converting it emitted 4 bytes where the original
contributed 0, so the ARM9 came back 4 bytes long and every following address
shifted — the same signature as the `FUN_02008560` pool bug in section 4a.
`carve_function.py` rejects a function whose `func_end` is its own `func_start`
(both non-word-aligned and `arm_func_start` empty-body cases are visible in the
disassembly and neither is convertible). Reverted; the seven functions above
replace it in the count.

Left in assembly, as before: `FUN_0200A480` / `FUN_0200A4B8` (the multi-call
`FUN_020071CC`-pair setup routine and its `MI_CpuFill8`/`FUN_0203F2FC` tail), and
the `FUN_0200AB50`–`FUN_0200ad30` bank, which are the 0x1C-stride record-array
sort/memmove helpers and need a struct view this batch declines to invent.

### Parallel lane H — eighth batch (`ai/space-bunny-parallel-h`)

Continued into the `0x0200E0BC`–`0x0200E4B0` accessor band from the parallel-B
tip (`d7c1162`). Baseline re-verified first: `make check-toolchain` OK,
9/9 tooling tests OK, `make compare-arm9` MATCH, `make compare` byte-identical.
Five functions converted, one commit each, `compare-arm9` MATCH after every one.

| Function | C | Verified |
| --- | --- | --- |
| `FUN_0200E3A0` | `(u8 *)ptr + 0xD2` | MATCH, `ROM matches` |
| `FUN_0200E394` | `FUN_020071CC(obj, 0x3F)` | MATCH, `ROM matches` |
| `FUN_0200E488` | `FUN_0216736C(index & 0xFF, count) + (count - 1)` | MATCH, `ROM matches` |
| `FUN_0200E49C` | `FUN_0200E4B0(...) < 0x63 ? 0 : 1` | MATCH, `ROM matches` |
| `FUN_0200E4B0` | `((u8 *)obj + FUN_0200E488(index, count))[0x3C]` | MATCH, `ROM matches` |

Three new headers declare the still-unnamed externals the band calls:
`include/unk_0216736C.h`, `include/unk_0200E488.h`, `include/unk_0200E4B0.h`.

Two codegen notes worth carrying forward:

- **`FUN_0200E488` operand order is load-bearing.** Its three plausible C
  spellings — `FUN(...) + (count - 1)`, `(count - 1) + FUN(...)`, and
  `base + offset` with both in locals — compile to the *same* instruction count
  but differ in the `add` operand order (`add r0, r1, r0` vs `add r0, r0, r1`).
  Only the last spelling matches. When a function is one byte short or long,
  diff the object against the built sbin with
  `cmp -l build/black.us/main.sbin <good copy>` before rewriting the C; the
  byte offset maps straight back to the instruction.
- **`asm/unk_0200E47C.s` removed.** It was a dead leftover never listed in
  `main.lsf` that duplicated `FUN_0200E49C` and `FUN_0200E4B0`, so
  `carve_function.py` located both in it and aborted with
  `Object asm/unk_0200E47C.o not in main.lsf`. Same class as the orphaned
  `asm/unk_02008568.s` cleaned up in section 4b; `carve_function.py` should
  prefer the file `main.lsf` actually links.

Left in assembly: `FUN_0200E0BC` (a 4-slot threshold search — nine C spellings
all matched instruction-for-instruction except the final `add r0, r4, #0`, which
MWCC allocates to a different callee-saved register than the original; reverted
rather than shipped unverified) and `FUN_0200E124`, which came to a single-byte
`ldrh` operand-order difference at 0x0200A135 after the body, table index and
copy-argument order were all resolved. Both are the same register-allocation
class as the `FUN_0200E488` note above and are the first things to retry.

## 5. What this document deliberately does not do

- No disassembly was carved or edited; `asm/` and `ndsdisasm_config/` are
  untouched at the time of writing.
- No C was written for any candidate without a verified match; each C file in
  `src/` listed above was accepted by `compare-arm9` and by a full
  byte-identical ROM build.
- No upstream pull request was prepared, and none is contemplated under this
  branch.