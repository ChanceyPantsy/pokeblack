	.include "asm/macros/function.inc"

	.extern FUN_02006E64
	.extern FUN_020071CC
	.extern FUN_020071e4
	.extern FUN_02007AC8
	.extern FUN_02008448
	.extern FUN_0200863C
	.extern FUN_02008748
	.extern FUN_02008808
	.extern FUN_02008850
	.extern FUN_020088B8
	.extern FUN_0200893C
	.extern FUN_02008954
	.extern FUN_02008964
	.extern FUN_020097F0
	.extern FUN_02009D08
	.extern FUN_0200A864
	.extern FUN_0200A884
	.extern FUN_0200B3C8
	.extern FUN_0200BE6C
	.extern FUN_0200C40C
	.extern FUN_0200C418
	.extern FUN_0200E89C
	.extern FUN_0200EEAC
	.extern FUN_020127A4
	.extern FUN_020127B8
	.extern FUN_020127C4
	.extern FUN_0201283C
	.extern FUN_02012964
	.extern FUN_02012EBC
	.extern FUN_02027584
	.extern FUN_0202889C
	.extern FUN_0202E794
	.extern FUN_02159BBC
	.extern FUN_0215E334
	.extern FUN_02161D64
	.extern FUN_021623BC
	.extern FUN_021647D8
	.extern FUN_0216CCB0
	.extern Heap_Free
	.extern MI_CpuCopy8

	.text
_02012B2C:
	.byte 0x01, 0x64, 0x70, 0x47
	.byte 0x81, 0x83, 0x70, 0x47, 0x80, 0x8B, 0x70, 0x47, 0x6E, 0x21, 0x89, 0x00, 0x40, 0x58, 0x70, 0x47
	.byte 0x01, 0x49, 0x40, 0x5C, 0x70, 0x47, 0xC0, 0x46, 0xCA, 0x01, 0x00, 0x00, 0x01, 0x4A, 0x81, 0x54
	.byte 0x70, 0x47, 0xC0, 0x46, 0xCA, 0x01, 0x00, 0x00, 0x01, 0x49, 0x40, 0x5C, 0x70, 0x47, 0xC0, 0x46
	.byte 0xCB, 0x01, 0x00, 0x00, 0x01, 0x4A, 0x81, 0x54, 0x70, 0x47, 0xC0, 0x46, 0xCB, 0x01

	non_word_aligned_thumb_func_start FUN_02012b6e
FUN_02012b6e: ; 0x02012B6E
	lsl r0, r0, #0
	mov r1, #0x73
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end FUN_02012b6e
_02012B78:
	.byte 0x73, 0x22, 0x92, 0x00, 0x81, 0x54, 0x70, 0x47
	.byte 0x01, 0x49, 0x40, 0x5C, 0x70, 0x47, 0xC0, 0x46, 0xCD, 0x01, 0x00, 0x00, 0x01, 0x4A, 0x81, 0x54
	.byte 0x70, 0x47, 0xC0, 0x46, 0xCD, 0x01, 0x00, 0x00, 0x41, 0x18, 0x1D, 0x20, 0x00, 0x01, 0x08, 0x5C
	.byte 0x70, 0x47, 0x00, 0x00, 0x41, 0x18, 0x1D, 0x20, 0x00, 0x01, 0x0A, 0x54, 0x70, 0x47, 0x00, 0x00

	thumb_func_start FUN_02012BB0
FUN_02012BB0: ; 0x02012BB0
	push {r3, lr}
	mov r1, #0x66
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_02008448
	cmp r0, #1
	bne _02012BC4
	mov r0, #1
	pop {r3, pc}
_02012BC4:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end FUN_02012BB0
_02012BC8:
	.byte 0x00, 0x29, 0x01, 0xD0, 0x01, 0x21, 0x00, 0xE0
	.byte 0x00, 0x21, 0x66, 0x22, 0x92, 0x00, 0x80, 0x58, 0x00, 0x4B, 0x18, 0x47

	thumb_func_start FUN_02012bdc
FUN_02012bdc: ; 0x02012BDC
	strh r1, [r2, #0x22]
	lsl r0, r0, #8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl FUN_02012EBC
	bl FUN_0200C40C
	add r1, r5, #0
	add r2, r4, #0
	bl FUN_0200C418
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_02012bdc
_02012BF8:
	.byte 0x10, 0xB5, 0x0C, 0x1C, 0x00, 0xF0, 0x60, 0xF9
	.byte 0xF9, 0xF7, 0x00, 0xFC, 0x21, 0x1C, 0xF9, 0xF7, 0x21, 0xFC, 0x10, 0xBD, 0x01, 0x49, 0x40, 0x18
	.byte 0x70, 0x47, 0xC0, 0x46, 0xE8, 0x05, 0x00, 0x00

	thumb_func_start FUN_02012C18
FUN_02012C18: ; 0x02012C18
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl FUN_020071e4
	cmp r0, #1
	beq _02012CDA
	add r0, r5, #0
	bl FUN_020127A4
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	bl FUN_02008808
	ldr r0, [r5]
	add r1, r4, #0
	bl FUN_020088B8
	add r0, r5, #0
	bl FUN_02012964
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0x29
	bl FUN_020071CC
	add r1, r0, #0
	add r0, r4, #0
	bl FUN_0200EEAC
	add r0, r5, #0
	bl FUN_020127B8
	add r1, r0, #0
	ldr r0, [r5]
	bl FUN_0200BE6C
	add r0, r5, #0
	bl FUN_020127C4
	add r4, r0, #0
	ldr r0, [r5]
	bl FUN_0200A864
	add r1, r4, #0
	bl FUN_0200A884
	ldr r6, _02012CDC ; =0x000005EC
	ldr r0, [r5]
	add r1, r5, r6
	bl FUN_0200B3C8
	mov r7, #0x57
	lsl r7, r7, #2
	add r1, r7, #0
	ldr r4, [r5, r7]
	add r1, #0x5c
	ldr r1, [r5, r1]
	add r0, r4, #0
	bl FUN_0200893C
	add r1, r7, #0
	add r1, #0x68
	add r0, r4, #0
	add r1, r5, r1
	bl FUN_02008954
	add r0, r5, #0
	bl FUN_0201283C
	add r4, r0, #0
	ldr r0, [r5]
	bl FUN_02009D08
	add r1, r4, #0
	bl FUN_020097F0
	ldr r0, [r5, r7]
	add r7, #0x69
	add r1, r5, r7
	bl FUN_02008964
	add r1, r6, #0
	add r1, #0xa8
	ldr r0, [r5]
	add r1, r5, r1
	bl FUN_0200E89C
	ldr r0, [r5]
	bl FUN_02008748
	add r6, #0xc0
	add r1, r0, #0
	ldr r0, [r5, r6]
	bl FUN_0200863C
_02012CDA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02012CDC: .word 0x000005EC
	thumb_func_end FUN_02012C18
