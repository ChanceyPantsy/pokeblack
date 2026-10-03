	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_02088864
	.extern FUN_0209C2B0
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_02008568
FUN_02008568: ; 0x02008568
	strb r1, [r0, #0x1a]
	bx lr
	thumb_func_end FUN_02008568

	thumb_func_start FUN_0200856C
FUN_0200856C: ; 0x0200856C
	ldrb r0, [r0, #0x18]
	bx lr
	thumb_func_end FUN_0200856C

	thumb_func_start FUN_02008570
FUN_02008570: ; 0x02008570
	ldrb r0, [r0, #0x19]
	bx lr
	thumb_func_end FUN_02008570
