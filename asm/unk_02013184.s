	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_020071a8
	.extern FUN_02007374
	.extern FUN_02008374
	.extern FUN_0200873c
	.extern FUN_020087E8
	.extern FUN_02008860
	.extern FUN_0200A864
	.extern FUN_0200A870
	.extern FUN_0200AE54
	.extern FUN_0200B040
	.extern FUN_0200BE54
	.extern FUN_0200EE64
	.extern FUN_0201042C
	.extern FUN_02010444
	.extern FUN_020127A4
	.extern FUN_020127B8
	.extern FUN_020127C4
	.extern FUN_02012964
	.extern FUN_02013270
	.extern FUN_0201A2A8
	.extern FUN_0201A30C
	.extern FUN_0202428C
	.extern FUN_02034F84
	.extern FUN_02034FE8
	.extern FUN_020457B0
	.extern Heap_Free
	.extern MI_CpuFill8

	.text
_02013158:
	.byte 0x82, 0x30, 0x00, 0x88, 0x08, 0x40, 0x70, 0x47
	.byte 0xF8, 0xB5, 0x0C, 0x1C, 0x06, 0x1C, 0x20, 0x1C, 0x10, 0x21, 0x00, 0x92, 0x10, 0x25, 0xF7, 0xF7
	.byte 0x71, 0xFE, 0x01, 0x1C, 0x3C, 0x27, 0x30, 0x1C, 0x79, 0x43, 0x76, 0x30, 0x01, 0x80, 0x20, 0x1C
	.byte 0x0F, 0x21, 0xF7, 0xF7

	thumb_func_start FUN_02013184
FUN_02013184: ; 0x02013184
	.hword 0xFE67
	add r1, r0, #0
	add r0, r6, #0
	mul r1, r7
	add r0, #0x74
	strh r1, [r0]
	add r1, r6, #0
	add r0, r4, #0
	add r1, #0x78
	bl FUN_0200B040
	add r0, r4, #0
	mov r1, #0x12
	bl FUN_0200AE54
	cmp r0, #3
	bhi _020131E6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020131B2: ; jump table
	.hword _020131E6 - _020131B2 - 2 ; case 0
	.hword _020131BA - _020131B2 - 2 ; case 1
	.hword _020131BC - _020131B2 - 2 ; case 2
	.hword _020131C6 - _020131B2 - 2 ; case 3
_020131BA:
	b _020131D6
_020131BC:
	add r0, r6, #0
	add r0, #0x82
	ldrh r1, [r0]
	lsl r0, r5, #6
	b _020131DE
_020131C6:
	add r0, r6, #0
	add r0, #0x82
	ldrh r1, [r0]
	lsl r0, r5, #6
	orr r1, r0
	add r0, r6, #0
	add r0, #0x82
	strh r1, [r0]
_020131D6:
	add r0, r6, #0
	add r0, #0x82
	ldrh r1, [r0]
	lsl r0, r5, #7
_020131DE:
	orr r1, r0
	add r0, r6, #0
	add r0, #0x82
	strh r1, [r0]
_020131E6:
	mov r5, #0
_020131E8:
	lsl r0, r5, #2
	add r7, r6, r0
	ldr r1, [r7, #0x24]
	cmp r1, #0
	beq _02013202
	ldr r2, [sp]
	add r0, r4, #0
	bl FUN_0201A30C
	ldr r1, [r7, #0x24]
	add r0, r4, #0
	bl FUN_0201A2A8
_02013202:
	add r5, r5, #1
	cmp r5, #4
	blt _020131E8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end FUN_02013184

	thumb_func_start FUN_0201320C
FUN_0201320C: ; 0x0201320C
	mov r1, #9
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	strb r1, [r0, #8]
	strh r1, [r0, #0xa]
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	strb r1, [r0, #9]
	bx lr
	thumb_func_end FUN_0201320C

	thumb_func_start FUN_02013220
FUN_02013220: ; 0x02013220
	mov r2, #0
	mov r1, #0xa
	str r2, [r0]
	str r2, [r0, #4]
	strb r2, [r0, #9]
	strb r2, [r0, #8]
	strh r2, [r0, #0xa]
	strb r1, [r0, #0xc]
	strb r2, [r0, #0xd]
	bx lr
	thumb_func_end FUN_02013220

	thumb_func_start FUN_02013234
FUN_02013234: ; 0x02013234
	push {r3, r4, r5, lr}
	mov r1, #0xef
	str r1, [sp]
	ldr r3, _0201326C ; =0x020A729C
	add r5, r0, #0
	mov r1, #0x28
	mov r2, #1
	.hword 0xF01D, 0xEA78 ; blx Heap_AllocDebug
	add r4, r0, #0
	mov r0, #0x10
	add r1, r5, #0
	blx FUN_020457B0
	str r0, [r4, #0x14]
	mov r0, #0
	str r0, [r4]
	add r0, r4, #0
	add r0, #0x18
	bl FUN_0202428C
	add r0, r4, #0
	add r0, #0x20
	bl FUN_0202428C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0201326C: .word 0x020A729C
	thumb_func_end FUN_02013234
