	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_02088864
	.extern FUN_0209C2B0
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_02008554
FUN_02008554: ; 0x02008554
	ldrb r0, [r0, #0x1c]
	bx lr
	thumb_func_end FUN_02008554
_02008558:
	.byte 0x01, 0x77, 0x70, 0x47, 0xC0, 0x7E, 0x70, 0x47

	thumb_func_start FUN_02008560
FUN_02008560: ; 0x02008560
	strb r1, [r0, #0x1b]
	bx lr
	thumb_func_end FUN_02008560
_02008564:
	.byte 0x80, 0x7E, 0x70, 0x47

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
