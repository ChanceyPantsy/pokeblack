	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_020071ec
	.extern FUN_02009864
	.extern FUN_020099D4
	.extern FUN_02009A1C
	.extern FUN_0200A400
	.extern FUN_0200A418
	.extern FUN_0200A480
	.extern FUN_020597C8
	.extern FUN_021DFC20
	.extern FUN_021DFE90
	.extern FUN_021DFEAC

	.text
_0200A41C:
	.byte 0x08, 0xB5, 0x41, 0x68
	.byte 0x00, 0x29, 0x02, 0xD0, 0x01, 0x29, 0x03, 0xD0, 0x05, 0xE0, 0xFF, 0xF7, 0xF5, 0xFF, 0x08, 0xBD
	.byte 0xFF, 0xF7, 0xF2, 0xFF

	thumb_func_start FUN_0200a434
FUN_0200a434: ; 0x0200A434
	pop {r3, pc}
	thumb_func_end FUN_0200a434
_0200A436:
	.byte 0x00, 0x20, 0x08, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0200A43C
FUN_0200A43C: ; 0x0200A43C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl FUN_0200A400
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0200A452
	cmp r0, #1
	beq _0200A466
	b _0200A47A
_0200A452:
	add r0, r5, #0
	bl FUN_0200A418
	mov r1, #1
	lsl r1, r1, #8
	add r1, r0, r1
	mov r0, #0xcc
	mul r0, r4
	add r0, r1, r0
	pop {r3, r4, r5, pc}
_0200A466:
	add r0, r5, #0
	bl FUN_0200A418
	mov r1, #1
	lsl r1, r1, #8
	add r1, r0, r1
	mov r0, #0xcc
	mul r0, r4
	add r0, r1, r0
	pop {r3, r4, r5, pc}
_0200A47A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end FUN_0200A43C
