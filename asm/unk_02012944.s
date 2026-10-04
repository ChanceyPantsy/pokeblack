	.include "asm/macros/function.inc"

	.extern FUN_02006E64
	.extern FUN_020071CC
	.extern FUN_020071e4
	.extern FUN_02007AC8
	.extern FUN_02008448
	.extern FUN_0200863C
	.extern FUN_02008748
	.extern FUN_02008808
	.extern FUN_02008850
	.extern FUN_020088B8
	.extern FUN_0200893C
	.extern FUN_02008954
	.extern FUN_02008964
	.extern FUN_020097F0
	.extern FUN_02009D08
	.extern FUN_0200A864
	.extern FUN_0200A884
	.extern FUN_0200B3C8
	.extern FUN_0200BE6C
	.extern FUN_0200C40C
	.extern FUN_0200C418
	.extern FUN_0200E89C
	.extern FUN_0200EEAC
	.extern FUN_020127A4
	.extern FUN_02012EBC
	.extern FUN_02027584
	.extern FUN_0202889C
	.extern FUN_0202E794
	.extern FUN_02159BBC
	.extern FUN_0215E334
	.extern FUN_02161D64
	.extern FUN_021623BC
	.extern FUN_021647D8
	.extern FUN_0216CCB0
	.extern Heap_Free
	.extern MI_CpuCopy8

	.text
_0201293C:
	.byte 0x67, 0x21, 0x89, 0x00
	.byte 0x40, 0x58, 0x70, 0x47

	thumb_func_start FUN_02012944
FUN_02012944: ; 0x02012944
	push {r3, lr}
	bl FUN_020127A4
	add r0, #0x20
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end FUN_02012944
_02012950:
	.byte 0x44, 0x22, 0x24, 0x30
