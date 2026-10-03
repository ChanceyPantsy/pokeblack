	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_020071ec
	.extern FUN_02009864
	.extern FUN_020099D4
	.extern FUN_02009A1C
	.extern FUN_0200A400
	.extern FUN_0200A43C
	.extern FUN_0200A480
	.extern FUN_020597C8
	.extern FUN_021DFC20
	.extern FUN_021DFE90
	.extern FUN_021DFEAC

	.text
	thumb_func_start FUN_02009c44
FUN_02009c44: ; 0x02009C44
	mul r1, r4
	add r4, r3, r5
	add r6, r3, r0
	ldrh r2, [r4, r1]
	ldrh r5, [r6, r5]
	add r2, r2, r5
	strh r2, [r4, r1]
	ldrh r5, [r4, r1]
	ldr r2, _02009CA0 ; =0x0000270F
	cmp r5, r2
	bls _02009C5C
	strh r2, [r4, r1]
_02009C5C:
	ldr r5, _02009CA4 ; =0x000001E6
	add r6, r3, r0
	add r4, r3, r5
	ldrh r2, [r4, r1]
	ldrh r5, [r6, r5]
	add r2, r2, r5
	strh r2, [r4, r1]
	ldrh r5, [r4, r1]
	ldr r2, _02009CA0 ; =0x0000270F
	cmp r5, r2
	bls _02009C74
	strh r2, [r4, r1]
_02009C74:
	mov r5, #0x7a
	lsl r5, r5, #2
	add r4, r3, r5
	add r6, r3, r0
	thumb_func_end FUN_02009c44

	thumb_func_start FUN_02009c7c
FUN_02009c7c: ; 0x02009C7C
	ldrh r2, [r4, r1]
	ldrh r5, [r6, r5]
	add r2, r2, r5
	strh r2, [r4, r1]
	ldrh r5, [r4, r1]
	ldr r2, _02009CA0 ; =0x0000270F
	cmp r5, r2
	bls _02009C8E
	strh r2, [r4, r1]
_02009C8E:
	mov r1, #7
	lsl r1, r1, #6
	add r1, r3, r1
	add r0, r1, r0
	mov r1, #0
	mov r2, #0x30
	.hword 0xF078, 0xEF98 ; blx MI_CpuFill8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02009CA0: .word 0x0000270F
_02009CA4: .word 0x000001E6
	thumb_func_end FUN_02009c7c
_02009CA8:
	.byte 0x00, 0x4B, 0x18, 0x47, 0xBC, 0x99, 0x05, 0x02
	.byte 0x10, 0xB5, 0x0C, 0x1C, 0xFF, 0xF7, 0xD4, 0xFD, 0x21, 0x1C, 0x4F, 0xF0, 0x80, 0xEE, 0x10, 0xBD
	.byte 0x30, 0xB5, 0x83, 0xB0, 0x04, 0x1C, 0xFF, 0xF7, 0xCB, 0xFD, 0x05, 0x1C, 0x20, 0x1C, 0x00, 0xAC
	.byte 0x21, 0x1C, 0xFF, 0xF7, 0xED, 0xFF, 0x28, 0x1C, 0x21, 0x1C, 0x4F, 0xF0, 0x08, 0xEE, 0x03, 0xB0
	.byte 0x30, 0xBD, 0x00, 0x00, 0x10, 0xB5, 0xFF, 0xF7, 0xBB, 0xFD, 0x04, 0x1C

	thumb_func_start FUN_02009cec
FUN_02009cec: ; 0x02009CEC
	blx FUN_020597C8
	cmp r0, #0
	beq _02009D02
	add r0, r4, #0
	.hword 0xF04F, 0xED34 ; blx FUN_02059760
	cmp r0, #0
	beq _02009D02
	mov r0, #1
	pop {r4, pc}
_02009D02:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FUN_02009cec
