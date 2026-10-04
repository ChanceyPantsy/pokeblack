	.include "asm/macros/function.inc"

	.extern FUN_020056A0
	.extern FUN_02016028
	.extern FUN_02016C38
	.extern FUN_02016C60
	.extern FUN_02021F64
	.extern FUN_0204A07C
	.extern FUN_0204A17C
	.extern FUN_02063A54
	.extern Heap_AllocDebug
	.extern Heap_Free

	.text
	thumb_func_start FUN_020169E8
FUN_020169E8: ; 0x020169E8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _02016B7C ; =0x00000136
	add r5, r1, #0
	ldrsb r1, [r5, r0]
	cmp r1, #0
	beq _020169F8
	b _02016B74
_020169F8:
	ldr r1, _02016B80 ; =0x000009A1
	add r0, #0x16
	str r1, [sp]
	ldr r0, [r5, r0]
	ldr r3, _02016B84 ; =0x020A72CC
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _02016B88 ; =0x00007FFF
	mov r2, #1
	and r1, r0
	add r0, r0, #1
	orr r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0x2c
	mov r6, #1
	blx Heap_AllocDebug
	add r4, r0, #0
	str r7, [r4, #0x20]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _02016A28
	mov r6, #0
_02016A28:
	str r6, [r4, #0x28]
	add r0, r5, #0
	mov r6, #0x52
	str r5, [r4, #0x24]
	add r0, #0xc0
	str r0, [r4, #0xc]
	lsl r6, r6, #2
	ldr r0, [r5, r6]
	ldr r1, [r7, #0x34]
	lsl r0, r0, #5
	add r0, r1, r0
	str r0, [r4, #0x1c]
	ldr r0, _02016B8C ; =0x000009A9
	ldr r3, _02016B84 ; =0x020A72CC
	str r0, [sp]
	add r0, r6, #4
	ldr r0, [r5, r0]
	mov r2, #0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _02016B88 ; =0x00007FFF
	and r1, r0
	add r0, r0, #1
	orr r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0x10
	.hword 0xF019, 0xEE6A ; blx Heap_AllocDebug
	add r1, r5, #0
	str r0, [r4, #4]
	add r1, #0xc0
	ldr r1, [r1]
	ldr r3, _02016B84 ; =0x020A72CC
	str r1, [r0]
	ldr r1, [r4, #4]
	mov r0, #0
	str r0, [r1, #4]
	add r0, r5, #0
	add r0, #0xdc
	ldr r1, [r0]
	ldr r0, [r4, #4]
	mov r2, #0
	str r1, [r0, #8]
	ldr r0, _02016B8C ; =0x000009A9
	add r0, r0, #5
	str r0, [sp]
	add r0, r6, #4
	ldr r0, [r5, r0]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _02016B88 ; =0x00007FFF
	and r1, r0
	mov r0, #0x10
	lsl r0, r0, #0xb
	orr r0, r1
	add r1, r5, #0
	add r1, #0xdc
	lsl r0, r0, #0x10
	ldr r1, [r1]
	lsr r0, r0, #0x10
	.hword 0xF019, 0xEE48 ; blx Heap_AllocDebug
	ldr r1, [r4, #4]
	str r0, [r1, #0xc]
	add r0, r6, #0
	sub r0, #8
	ldr r0, [r5, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	beq _02016AC8
	add r0, r6, #0
	sub r0, #0xc
	ldr r0, [r5, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xd8
	b _02016AD8
_02016AC8:
	add r0, r6, #0
	sub r0, #0xc
	ldr r0, [r5, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xd4
_02016AD8:
	add r2, r5, #0
	add r2, #0xdc
	ldr r2, [r2]
	ldr r1, [r4, #4]
	lsr r3, r2, #0x1f
	add r3, r2, r3
	lsl r2, r3, #0xf
	sub r6, #0x14
	ldrb r3, [r5, r6]
	ldr r0, [r0]
	ldr r1, [r1, #0xc]
	lsr r2, r2, #0x10
	bl FUN_02021F64
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02016B02
	bl FUN_02016C38
	mov r0, #0
	str r0, [r5, #4]
_02016B02:
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _02016B14
	ldr r1, _02016B90 ; =0x0201691D
	add r2, r4, #0
	mov r3, #0
	.hword 0xF01A, 0xE94C ; blx FUN_02030DA8
	b _02016B1E
_02016B14:
	ldr r0, _02016B90 ; =0x0201691D
	add r1, r4, #0
	mov r2, #0
	bl FUN_020056A0
_02016B1E:
	str r0, [r5, #4]
	mov r0, #0x4d
	lsl r0, r0, #2
	add r2, r0, #1
	ldrsb r1, [r5, r0]
	ldrsb r3, [r5, r2]
	cmp r1, r3
	bne _02016B3E
	add r1, r0, #0
	add r1, #0xc
	ldr r2, [r5, r1]
	ldr r1, _02016B94 ; =0xFFFFEFFF
	add r0, #0xc
	and r1, r2
	str r1, [r5, r0]
	b _02016B6A
_02016B3E:
	add r2, r0, #4
	ldr r2, [r5, r2]
	lsl r4, r2, #0x18
	asr r4, r4, #0x18
	add r1, r1, r4
	strb r1, [r5, r0]
	cmp r2, #0
	blt _02016B54
	ldrsb r0, [r5, r0]
	cmp r0, r3
	bge _02016B64
_02016B54:
	cmp r2, #0
	bge _02016B6A
	ldr r0, _02016B98 ; =0x00000135
	ldrsb r3, [r5, r0]
	sub r0, r0, #1
	ldrsb r0, [r5, r0]
	cmp r0, r3
	bgt _02016B6A
_02016B64:
	mov r0, #0x4d
	lsl r0, r0, #2
	strb r3, [r5, r0]
_02016B6A:
	ldr r0, _02016B9C ; =0x00000137
	ldrsb r1, [r5, r0]
	sub r0, r0, #1
	strb r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02016B74:
	sub r1, r1, #1
	strb r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02016B7C: .word 0x00000136
_02016B80: .word 0x000009A1
_02016B84: .word 0x020A72CC
_02016B88: .word 0x00007FFF
_02016B8C: .word 0x000009A9
_02016B90: .word 0x0201691D
_02016B94: .word 0xFFFFEFFF
_02016B98: .word 0x00000135
_02016B9C: .word 0x00000137
	thumb_func_end FUN_020169E8
