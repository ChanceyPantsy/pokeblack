	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_020072A4
	.extern FUN_020072CC
	.extern FUN_0200B888
	.extern FUN_0200B8AC
	.extern Heap_AllocDebug
	.extern MI_CpuCopy8
	.extern MI_CpuFill8

	.text
	arm_func_start FUN_0200ae2c
FUN_0200ae2c: ; 0x0200AE2C
	stcne p12, c1, [r2], #-0x18
	swi 0x3cf03a
	arm_func_end FUN_0200ae2c
_0200AE34:
	.byte 0x30, 0x1C, 0x3A, 0xF0, 0xE6, 0xEE, 0x70, 0xBD, 0x38, 0xB5, 0x05, 0x1C
	.byte 0x1A, 0x20, 0x3A, 0xF0, 0xB6, 0xEC, 0x04, 0x1C, 0x28, 0x1C, 0x21, 0x1C, 0xFF, 0xF7, 0xE4, 0xFF
	.byte 0x20, 0x1C, 0x38, 0xBD

	thumb_func_start FUN_0200AE54
FUN_0200AE54: ; 0x0200AE54
	mov r2, #0
	cmp r1, #0x16
	bhi _0200AEE4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0200AE66: ; jump table
	.hword _0200AE94 - _0200AE66 - 2 ; case 0
	.hword _0200AE96 - _0200AE66 - 2 ; case 1
	.hword _0200AE9A - _0200AE66 - 2 ; case 2
	.hword _0200AE9E - _0200AE66 - 2 ; case 3
	.hword _0200AEA2 - _0200AE66 - 2 ; case 4
	.hword _0200AEA6 - _0200AE66 - 2 ; case 5
	.hword _0200AEAA - _0200AE66 - 2 ; case 6
	.hword _0200AEAE - _0200AE66 - 2 ; case 7
	.hword _0200AEB2 - _0200AE66 - 2 ; case 8
	.hword _0200AEE4 - _0200AE66 - 2 ; case 9
	.hword _0200AEE4 - _0200AE66 - 2 ; case 10
	.hword _0200AEB6 - _0200AE66 - 2 ; case 11
	.hword _0200AEBC - _0200AE66 - 2 ; case 12
	.hword _0200AEC0 - _0200AE66 - 2 ; case 13
	.hword _0200AEE4 - _0200AE66 - 2 ; case 14
	.hword _0200AEC4 - _0200AE66 - 2 ; case 15
	.hword _0200AEC8 - _0200AE66 - 2 ; case 16
	.hword _0200AECC - _0200AE66 - 2 ; case 17
	.hword _0200AED0 - _0200AE66 - 2 ; case 18
	.hword _0200AED4 - _0200AE66 - 2 ; case 19
	.hword _0200AED8 - _0200AE66 - 2 ; case 20
	.hword _0200AEDC - _0200AE66 - 2 ; case 21
	.hword _0200AEE0 - _0200AE66 - 2 ; case 22
_0200AE94:
	b _0200AEE2
_0200AE96:
	ldrb r2, [r0, #1]
	b _0200AEE4
_0200AE9A:
	ldrb r2, [r0, #2]
	b _0200AEE4
_0200AE9E:
	ldrb r2, [r0, #3]
	b _0200AEE4
_0200AEA2:
	ldrb r2, [r0, #4]
	b _0200AEE4
_0200AEA6:
	ldrb r2, [r0, #5]
	b _0200AEE4
_0200AEAA:
	ldrh r2, [r0, #6]
	b _0200AEE4
_0200AEAE:
	ldrb r2, [r0, #8]
	b _0200AEE4
_0200AEB2:
	ldrb r2, [r0, #9]
	b _0200AEE4
_0200AEB6:
	add r0, #0xa8
	ldrh r2, [r0]
	b _0200AEE4
_0200AEBC:
	add r0, #0xaa
	b _0200AEE2
_0200AEC0:
	add r0, #0xab
	b _0200AEE2
_0200AEC4:
	add r0, #0xb3
	b _0200AEE2
_0200AEC8:
	add r0, #0xb4
	b _0200AEE2
_0200AECC:
	add r0, #0xb5
	b _0200AEE2
_0200AED0:
	add r0, #0xb6
	b _0200AEE2
_0200AED4:
	add r0, #0xb8
	b _0200AEE2
_0200AED8:
	add r0, #0xb9
	b _0200AEE2
_0200AEDC:
	add r0, #0xba
	b _0200AEE2
_0200AEE0:
	add r0, #0xbb
_0200AEE2:
	ldrb r2, [r0]
_0200AEE4:
	add r0, r2, #0
	bx lr
	thumb_func_end FUN_0200AE54
_0200AEE8:
	.byte 0x16, 0x29, 0x6F, 0xD8, 0x49, 0x18, 0x79, 0x44
	.byte 0xC9, 0x88, 0x09, 0x04, 0x09, 0x14, 0x8F, 0x44, 0x2C, 0x00, 0x34, 0x00, 0x3C, 0x00, 0x44, 0x00
	.byte 0x4C, 0x00, 0x54, 0x00, 0x5C, 0x00, 0x68, 0x00, 0x70, 0x00, 0xD2, 0x00, 0xD2, 0x00, 0x78, 0x00
	.byte 0x84, 0x00, 0x8A, 0x00, 0xD2, 0x00, 0x94, 0x00, 0x9A, 0x00, 0xA0, 0x00, 0xAA, 0x00, 0xB0, 0x00
	.byte 0xBA, 0x00, 0xC4, 0x00, 0xCE, 0x00, 0x07, 0x2A, 0x50, 0xDA, 0x02, 0x70, 0x70, 0x47, 0x06, 0x2A
	.byte 0x4C, 0xDA

	non_word_aligned_thumb_func_start FUN_0200af32
FUN_0200af32: ; 0x0200AF32
	strb r2, [r0, #1]
	bx lr
	thumb_func_end FUN_0200af32
_0200AF36:
	.byte 0x06, 0x2A, 0x48, 0xDA, 0x82, 0x70, 0x70, 0x47, 0x06, 0x2A
	.byte 0x44, 0xDA, 0xC2, 0x70, 0x70, 0x47, 0x64, 0x2A, 0x40, 0xDC, 0x02, 0x71, 0x70, 0x47, 0x06, 0x2A
	.byte 0x3C, 0xDC, 0x42, 0x71, 0x70, 0x47, 0x96, 0x21, 0x89, 0x00, 0x8A, 0x42, 0x36, 0xDC, 0xC2, 0x80
	.byte 0x70, 0x47, 0x02, 0x2A

	thumb_func_start FUN_0200af64
FUN_0200af64: ; 0x0200AF64
	bge _0200AFCC
	strb r2, [r0, #8]
	bx lr
	thumb_func_end FUN_0200af64
_0200AF6A:
	.byte 0x02, 0x2A, 0x2E, 0xDA, 0x42, 0x72
	.byte 0x70, 0x47, 0x17, 0x49, 0x8A, 0x42, 0x29, 0xDA, 0xA8, 0x30, 0x02, 0x80, 0x70, 0x47, 0xAA, 0x30
	.byte 0x02, 0x70, 0x70, 0x47, 0x02, 0x2A, 0x21, 0xDA, 0xAB, 0x30, 0x02, 0x70, 0x70, 0x47, 0xB3, 0x30
	.byte 0x02, 0x70, 0x70, 0x47, 0xB4, 0x30, 0x02, 0x70, 0x70, 0x47, 0x02, 0x2A, 0x16, 0xDA, 0xB5, 0x30
	.byte 0x02, 0x70, 0x70, 0x47, 0xB6, 0x30, 0x02, 0x70, 0x70, 0x47, 0x02, 0x2A, 0x0E, 0xDA, 0xB8, 0x30
	.byte 0x02, 0x70, 0x70, 0x47, 0x63, 0x2A, 0x09, 0xDC, 0xB9, 0x30, 0x02, 0x70, 0x70, 0x47

	non_word_aligned_thumb_func_start FUN_0200afbe
FUN_0200afbe: ; 0x0200AFBE
	cmp r2, #6
	bge _0200AFCC
	add r0, #0xba
	strb r2, [r0]
	bx lr
_0200AFC8:
	.byte 0xBB, 0x30, 0x02, 0x70
_0200AFCC:
	bx lr
	nop
	thumb_func_end FUN_0200afbe
_0200AFD0:
	.byte 0x8B, 0x02, 0x00, 0x00

	thumb_func_start FUN_0200AFD4
FUN_0200AFD4: ; 0x0200AFD4
	push {r4, r5}
	asr r3, r2, #2
	lsr r3, r3, #0x1d
	add r3, r2, r3
	thumb_func_end FUN_0200AFD4

	thumb_func_start FUN_0200afdc
FUN_0200afdc: ; 0x0200AFDC
	lsr r5, r2, #0x1f
	lsl r4, r2, #0x1d
	sub r4, r4, r5
	mov r2, #0x1d
	ror r4, r2
	asr r3, r3, #3
	add r2, r5, r4
	cmp r1, #9
	beq _0200AFF8
	cmp r1, #0xa
	thumb_func_end FUN_0200afdc

	thumb_func_start FUN_0200aff0
FUN_0200aff0: ; 0x0200AFF0
	beq _0200B00C
	cmp r1, #0xe
	beq _0200B022
	b _0200B038
_0200AFF8:
	add r0, r0, r3
	mov r4, #1
	ldrb r0, [r0, #0xa]
	lsl r4, r2
	mov r1, #1
	tst r0, r4
	beq _0200B038
	add r0, r1, #0
	pop {r4, r5}
	bx lr
_0200B00C:
	add r0, r0, r3
	add r0, #0x5c
	mov r4, #1
	ldrb r0, [r0]
	lsl r4, r2
	mov r1, #1
	tst r0, r4
	beq _0200B038
	add r0, r1, #0
	pop {r4, r5}
	bx lr
_0200B022:
	add r0, r0, r3
	add r0, #0xac
	mov r4, #1
	ldrb r0, [r0]
	lsl r4, r2
	mov r1, #1
	tst r0, r4
	beq _0200B038
	add r0, r1, #0
	pop {r4, r5}
	bx lr
	thumb_func_end FUN_0200aff0
_0200B038:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
