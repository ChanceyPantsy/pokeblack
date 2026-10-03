	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_02008854
	.extern FUN_02014468
	.extern FUN_0202428C
	.extern FUN_0203F2FC
	.extern FUN_0203F328
	.extern FUN_02082A48
	.extern FUN_02087C88

	.text
	thumb_func_start FUN_0200893C
FUN_0200893C: ; 0x0200893C
	add r2, r0, #0
	add r2, #0x72
	add r0, r1, #0
	ldrb r1, [r2]
	ldr r3, _02008948 ; =FUN_02014464
	bx r3
	.balign 4, 0
_02008948: .word 0x02014465 ; was FUN_02014464
	thumb_func_end FUN_0200893C
