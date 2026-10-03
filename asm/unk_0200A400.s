	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_020071ec
	.extern FUN_02009864
	.extern FUN_020099D4
	.extern FUN_02009A1C
	.extern FUN_0200A480
	.extern FUN_020597C8
	.extern FUN_021DFC20
	.extern FUN_021DFE90
	.extern FUN_021DFEAC

	.text
	thumb_func_start FUN_0200A400
FUN_0200A400: ; 0x0200A400
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0200A40C
	cmp r0, #1
	beq _0200A410
	b _0200A414
_0200A40C:
	mov r0, #3
	bx lr
_0200A410:
	mov r0, #0xc
	bx lr
_0200A414:
	mov r0, #0
	bx lr
	thumb_func_end FUN_0200A400
