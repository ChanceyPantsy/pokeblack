	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_02088864
	.extern FUN_0209C2B0
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_02008570
FUN_02008570: ; 0x02008570
	ldrb r0, [r0, #0x19]
	bx lr
	thumb_func_end FUN_02008570
