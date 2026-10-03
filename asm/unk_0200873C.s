	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_02088864
	.extern FUN_0209C2B0
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_0200873c
FUN_0200873c: ; 0x0200873C
	ldr r3, _02008744 ; =FUN_020071CC
	mov r1, #0x1b
	bx r3
	nop
_02008744: .word 0x020071CD ; was FUN_020071CC
	thumb_func_end FUN_0200873c
