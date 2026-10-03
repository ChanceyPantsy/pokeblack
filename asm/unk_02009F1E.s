	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_020071ec
	.extern FUN_02009864
	.extern FUN_020099D4
	.extern FUN_02009A1C
	.extern FUN_02009F0C
	.extern FUN_0200A400
	.extern FUN_0200A43C
	.extern FUN_0200A480
	.extern FUN_020597C8
	.extern FUN_021DFC20
	.extern FUN_021DFE90
	.extern FUN_021DFEAC

	.text
_02009F1C:
	.byte 0x70, 0xB5

	non_word_aligned_thumb_func_start FUN_02009f1e
FUN_02009f1e: ; 0x02009F1E
	add r6, r0, #0
	bl FUN_0200A400
	add r5, r0, #0
	ldr r4, _02009F4C ; =0x00000000
	beq _02009F48
_02009F2A:
	add r0, r6, #0
	add r1, r4, #0
	bl FUN_0200A43C
	add r0, #0xb3
	ldrb r0, [r0]
	bl FUN_02009F0C
	cmp r0, #0
	bne _02009F42
	mov r0, #1
	pop {r4, r5, r6, pc}
_02009F42:
	add r4, r4, #1
	cmp r4, r5
	blo _02009F2A
_02009F48:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02009F4C: .word 0x00000000
	thumb_func_end FUN_02009f1e
