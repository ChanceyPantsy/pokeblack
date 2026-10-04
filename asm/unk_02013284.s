.include "asm/macros/function.inc"

	.extern FUN_02012984
	.extern FUN_02013234
	.extern FUN_0201A920
	.extern FUN_0202A3FC
	.extern FUN_0202A440
	.extern FUN_0202A4B4
	.extern FUN_0216AAE4

	.text

	thumb_func_start FUN_02013284
FUN_02013284: ; 0x02013284
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	add r5, r3, #0
	str r0, [sp, #0x1c]
	ldr r0, [r5]
	add r6, r2, #0
	str r1, [sp]
	cmp r0, #0
	bne _020132A0
	ldr r0, [sp, #0x1c]
	bl FUN_0201A920
	str r0, [r5]
_020132A0:
	add r7, r4, #0
	lsl r6, r6, #2
	add r7, #0x48
	ldr r0, [r7, r6]
	cmp r0, #0
	bne _020132B4
	ldr r0, [sp, #0x1c]
	bl FUN_02013234
	str r0, [r7, r6]
_020132B4:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0201332A
	ldr r1, [r7, r6]
	ldr r2, [sp, #0x1c]
	bl FUN_0202A440
	ldr r0, [sp, #0x18]
	ldr r1, [r5]
	ldr r2, [sp, #0x1c]
	bl FUN_0202A4B4
	ldr r0, [sp]
	bl FUN_02012984
	add r2, r0, #0
	ldr r0, [sp]
	ldr r1, [r5]
	bl FUN_0216AAE4
	ldr r0, [r7, r6]
	ldr r0, [r0, #4]
	bl FUN_0202A3FC
	cmp r0, #0xb
	bhi _02013326
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020132F4: ; jump table
	.hword _02013326 - _020132F4 - 2 ; case 0
	.hword _02013326 - _020132F4 - 2 ; case 1
	.hword _0201330C - _020132F4 - 2 ; case 2
	.hword _0201330C - _020132F4 - 2 ; case 3
	.hword _02013318 - _020132F4 - 2 ; case 4
	.hword _02013326 - _020132F4 - 2 ; case 5
	.hword _02013320 - _020132F4 - 2 ; case 6
	.hword _02013312 - _020132F4 - 2 ; case 7
	.hword _02013312 - _020132F4 - 2 ; case 8
	.hword _02013320 - _020132F4 - 2 ; case 9
	.hword _02013326 - _020132F4 - 2 ; case 10
	.hword _02013318 - _020132F4 - 2 ; case 11
_0201330C:
	ldr r0, _0201332C ; =0x0000047E
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02013312:
	ldr r0, _02013330 ; =0x0000047F
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02013318:
	mov r0, #0x12
	lsl r0, r0, #6
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02013320:
	ldr r0, _02013334 ; =0x00000491
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02013326:
	ldr r0, _02013338 ; =0x0000047D
	strh r0, [r4, #0x1a]
_0201332A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0201332C: .word 0x0000047E
_02013330: .word 0x0000047F
_02013334: .word 0x00000491
_02013338: .word 0x0000047D
	thumb_func_end FUN_02013284