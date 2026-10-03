	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_02008560
	.extern FUN_02088864
	.extern FUN_0209C2B0
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_020084F8
FUN_020084F8: ; 0x020084F8
	ldr r3, _020084FC ; =FUN_0201F41C
	bx r3
	.balign 4, 0
_020084FC: .word 0x0201F41D ; was FUN_0201F41C
	thumb_func_end FUN_020084F8
