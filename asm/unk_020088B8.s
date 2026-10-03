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
	thumb_func_start FUN_020088B8
FUN_020088B8: ; 0x020088B8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl FUN_02008854
	add r2, r0, #0
	add r0, #0x80
	ldrh r0, [r0]
	add r5, r2, #0
	add r5, #0x84
	strh r0, [r4]
	ldmia r5!, {r0, r1}
	add r3, r4, #4
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r2, #0
	add r0, #0x90
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	add r0, r2, #0
	add r0, #0x92
	ldrh r0, [r0]
	strh r0, [r4, #0x12]
	add r0, r2, #0
	add r0, #0x94
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	add r0, r2, #0
	add r0, #0x96
	ldrh r0, [r0]
	strh r0, [r4, #0x16]
	mov r0, #0x98
	ldrsh r0, [r2, r0]
	strh r0, [r4, #0x18]
	add r0, r2, #0
	add r0, #0x9a
	ldrb r0, [r0]
	add r2, #0x9b
	strb r0, [r4, #0x1b]
	ldrb r0, [r2]
	str r0, [r4, #0x40]
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_020088B8
_0200890C:
	.byte 0x10, 0xB5, 0x0C, 0x1C
	.byte 0xFF, 0xF7, 0xA0, 0xFF, 0x02, 0x1C, 0x80, 0x32, 0x03, 0xCA, 0x03, 0xC4, 0x03, 0xCA, 0x03, 0xC4
	.byte 0x03, 0xCA, 0x03, 0xC4, 0x10, 0x68, 0x20, 0x60, 0x10, 0xBD, 0x00, 0x00
