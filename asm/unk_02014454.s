	.include "asm/macros/function.inc"

	.extern FUN_020120F0
	.extern FUN_020120F4
	.extern FUN_0201210C
	.extern FUN_020122C0
	.extern FUN_02012374
	.extern FUN_020124E8
	.extern FUN_02012A30
	.extern FUN_02013B74
	.extern FUN_02013B90
	.extern FUN_02013C70
	.extern FUN_020289B8
	.extern FUN_0215FA34
	.extern FUN_0215FA44
	.extern FUN_02188BD8
	.extern FUN_02188BE8
	.extern FUN_021BE8D4
	.extern FUN_021BE92C
	.extern Heap_AllocDebug
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_02014454
FUN_02014454: ; 0x02014454
	strb r1, [r0, #4]
	bx lr
	thumb_func_end FUN_02014454

	thumb_func_start FUN_02014458
FUN_02014458: ; 0x02014458
	ldrb r0, [r0, #4]
	bx lr
	thumb_func_end FUN_02014458

	thumb_func_start FUN_0201445c
FUN_0201445c: ; 0x0201445C
	strb r1, [r0, #5]
	thumb_func_end FUN_0201445c

	non_word_aligned_thumb_func_start FUN_0201445e
FUN_0201445e: ; 0x0201445E
	bx lr
	thumb_func_end FUN_0201445e

	thumb_func_start FUN_02014460
FUN_02014460: ; 0x02014460
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end FUN_02014460
