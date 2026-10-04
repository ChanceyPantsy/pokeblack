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
	thumb_func_start FUN_020127B8
FUN_020127B8: ; 0x020127B8
	ldr r3, _020127C0 ; =FUN_020127AC
	mov r1, #3
	thumb_func_end FUN_020127B8

	thumb_func_start FUN_020127bc
FUN_020127bc: ; 0x020127BC
	bx r3
	nop
_020127C0: .word 0x020127AD ; was FUN_020127AC
	thumb_func_end FUN_020127bc

	thumb_func_start FUN_020127C4
FUN_020127C4: ; 0x020127C4
	ldr r3, _020127CC ; =FUN_020127D0
	mov r1, #1
	bx r3
	nop
_020127CC: .word 0x020127D1 ; was FUN_020127D0
	thumb_func_end FUN_020127C4
