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

	thumb_func_start FUN_02008500
FUN_02008500: ; 0x02008500
	add r2, r0, #0
	add r0, r1, #0
	ldr r3, _0200850C ; =FUN_02045924
	add r1, r2, #0
	bx r3
	nop
_0200850C: .word 0x02045924 ; was FUN_02045924
	thumb_func_end FUN_02008500
_02008510:
	.byte 0x38, 0xB5, 0x09, 0x04, 0x04, 0x1C, 0x08, 0x20, 0x09, 0x0C, 0x3D, 0xF0, 0x4A, 0xE9, 0x05, 0x1C
	.byte 0x20, 0x1C, 0x29, 0x1C, 0xFF, 0xF7, 0xEC, 0xFF, 0x28, 0x1C, 0x38, 0xBD, 0x01, 0x61, 0x70, 0x47
