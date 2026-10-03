	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_02088864
	.extern FUN_0209C2B0
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_02008534
FUN_02008534: ; 0x02008534
	ldr r0, [r0, #0x10]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end FUN_02008534

	thumb_func_start FUN_0200853C
FUN_0200853C: ; 0x0200853C
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end FUN_0200853C
_02008540:
	.byte 0x42, 0x69, 0x00, 0x2A, 0x00, 0xD1, 0x41, 0x61, 0x70, 0x47, 0x00, 0x00, 0x41, 0x77, 0x70, 0x47
