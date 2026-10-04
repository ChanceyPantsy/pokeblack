	.include "asm/macros/function.inc"

	.extern FUN_020082EC
	.extern FUN_02008314
	.extern FUN_0200846C
	.extern FUN_0200873c
	.extern FUN_0200C0E8
	.extern FUN_0200C258
	.extern FUN_0200CA1C
	.extern FUN_020127A4
	.extern FUN_02012924
	.extern FUN_0201292C
	.extern FUN_02012934
	.extern FUN_02012944
	.extern FUN_0201296C
	.extern FUN_02012984
	.extern FUN_02012EBC
	.extern FUN_02012F20
	.extern FUN_02012F2C
	.extern FUN_020130C4
	.extern FUN_02013144
	.extern FUN_0201320C
	.extern FUN_02013234
	.extern FUN_02013284
	.extern FUN_0201333C
	.extern FUN_02013980
	.extern FUN_020142E8
	.extern FUN_0201A920
	.extern FUN_0201AC2C
	.extern Heap_Free
	.extern FUN_0216AAE4

	.text

	thumb_func_start FUN_02013360
FUN_02013360: ; 0x02013360
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r1, r5, #0
	mov r0, #0
	ldr r2, _02013470 ; =0x0000FFFF
	add r1, #0x84
	strh r2, [r1]
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
	add r1, r5, #0
	add r1, #0x21
	strb r0, [r1]
	add r1, r5, #0
	add r1, #0x22
	strb r0, [r1]
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	add r1, r5, #0
	add r1, #0x23
	strb r0, [r1]
	add r1, r5, #0
	add r1, #0xc1
	ldrb r2, [r1]
	thumb_func_end FUN_02013360

	non_word_aligned_thumb_func_start FUN_02013396
FUN_02013396: ; 0x02013396
	mov r1, #1
	str r0, [r5, #0x1c]
	bic r2, r1
	add r1, r5, #0
	add r1, #0xc1
	strb r2, [r1]
	add r1, r5, #0
	add r1, #0xc1
	ldrb r2, [r1]
	mov r1, #2
	str r4, [r5, #0x58]
	bic r2, r1
	add r1, r5, #0
	add r1, #0xc1
	strb r2, [r1]
	thumb_func_end FUN_02013396

	arm_func_start FUN_020133b4
FUN_020133b4: ; 0x020133B4
	arm_func_end FUN_020133b4
_020133B4:
	.byte 0x01, 0x1C

	non_word_aligned_thumb_func_start FUN_020133B6
FUN_020133B6: ; 0x020133B6
	lsl r2, r0, #2
	add r2, r5, r2
	str r1, [r2, #0x24]
	add r0, r0, #1
	str r1, [r2, #0x34]
	cmp r0, #4
	blo FUN_020133B6
	mov r0, #0
_020133C6:
	add r2, r5, r1
	add r2, #0xc2
	add r1, r1, #1
	strb r0, [r2]
	cmp r1, #6
	blo _020133C6
	add r1, r5, #0
	mov r2, #1
	add r1, #0x7f
	strb r2, [r1]
	mov r2, #0
_020133DC:
	add r1, r5, r0
	add r1, #0x78
	add r0, r0, #1
	strb r2, [r1]
	cmp r0, #7
	blo _020133DC
	add r0, r4, #0
	bl FUN_02012944
	str r0, [r5, #0x34]
	add r0, r4, #0
	bl FUN_0201292C
	str r0, [r5, #0x60]
	add r0, r4, #0
	bl FUN_02012924
	str r0, [r5, #0x64]
	add r0, r4, #0
	thumb_func_end FUN_020133B6

	non_word_aligned_thumb_func_start FUN_02013402
FUN_02013402: ; 0x02013402
	bl FUN_0200CA1C
	str r0, [r5, #0x68]
	add r0, r4, #0
	bl FUN_02012F20
	str r0, [r5, #0x70]
	add r0, r4, #0
	bl FUN_02012F2C
	str r0, [r5, #0x6c]
	add r0, r4, #0
	bl FUN_02012EBC
	add r7, r0, #0
	bl FUN_0200C0E8
	str r0, [sp]
	add r0, r7, #0
	bl FUN_0200873c
	str r0, [r5, #0x5c]
	ldr r0, [sp]
	bl FUN_0200C258
	add r1, r5, #0
	add r1, #0x80
	strb r0, [r1]
	add r1, r5, #0
	add r0, r6, #0
	add r1, #8
	mov r2, #0x10
	.hword 0xF06F, 0xEC80 ; blx MI_CpuCopy8
	ldr r0, _02013474 ; =0x00000468
	mov r1, #1
	strh r0, [r5, #0x18]
	add r0, #0x14
	strh r0, [r5, #0x1a]
	add r0, r5, #0
	add r0, #0x8c
	str r1, [r0]
	add r0, r4, #0
	bl FUN_0201296C
	ldr r1, _02013478 ; =0x0000096D
	bl FUN_020142E8
	cmp r0, #0
	beq _0201346E
	add r0, r5, #0
	mov r1, #2
	bl FUN_02013144
_0201346E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02013470: .word 0x0000FFFF
_02013474: .word 0x00000468
_02013478: .word 0x0000096D
	thumb_func_end FUN_02013402
_0201347C:
	.byte 0xF8, 0xB5, 0x82, 0xB0
	.byte 0x04, 0x1C, 0x0E, 0x1C, 0x1F, 0x1C, 0x15, 0x1C, 0xFF, 0xF7, 0x1C, 0xFE, 0x20, 0x1C, 0x31, 0x1C
	.byte 0x3A, 0x1C, 0xFF, 0xF7, 0x65, 0xFF, 0x08, 0xAF, 0xBA, 0x88, 0x20, 0x1C, 0x31, 0x1C, 0xFF, 0xF7
	.byte 0x4D, 0xFF, 0xB8, 0x88, 0x07, 0xF0, 0x3C, 0xFA, 0x01, 0x1C, 0xA1, 0x62, 0x00, 0x2D, 0x02, 0xD0
	.byte 0x28, 0x1C, 0x07, 0xF0, 0xBB, 0xFB, 0x08, 0x98, 0x00, 0x27, 0x60, 0x60, 0x60, 0x6A, 0x27, 0x60
	.byte 0x07, 0xF0, 0xAA, 0xFA, 0x05, 0x1C, 0x60, 0x6A, 0x07, 0xF0, 0xA4, 0xFA, 0x85, 0x42, 0x0E, 0xD1
	.byte 0x30, 0x1C, 0xFF, 0xF7, 0x33, 0xFA, 0x01, 0xA9, 0x00, 0xAA, 0x01, 0x97, 0x00, 0x97, 0xF4, 0xF7
	.byte 0xF7, 0xF8, 0x00, 0x28, 0x03, 0xD1, 0x20, 0x1C, 0x40, 0x21, 0xFF, 0xF7, 0x2B, 0xFE, 0x02, 0xB0
	.byte 0xF8, 0xBD, 0x00, 0x00, 0xF8, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x1F, 0x1C, 0x16, 0x1C, 0xFF, 0xF7
	.byte 0xE1, 0xFD, 0x28, 0x1C, 0x21, 0x1C, 0x3A, 0x1C, 0xFF, 0xF7, 0x2A, 0xFF, 0x06, 0xAA, 0x12, 0x88
	.byte 0x28, 0x1C, 0x21, 0x1C, 0xFF, 0xF7, 0x12, 0xFF, 0x01, 0x20, 0x28, 0x60, 0x01, 0x48, 0x6E, 0x60
	.byte 0x68, 0x83, 0xF8, 0xBD, 0x7D, 0x04, 0x00, 0x00

