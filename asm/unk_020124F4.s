	.include "asm/macros/function.inc"

	.extern FUN_02006E40
	.extern FUN_020070a4
	.extern FUN_020071CC
	.extern FUN_020071e4
	.extern FUN_02007aa4
	.extern FUN_02008468
	.extern FUN_0200857C
	.extern FUN_02008730
	.extern FUN_0200873c
	.extern FUN_02008844
	.extern FUN_02008848
	.extern FUN_0200884C
	.extern FUN_02008854
	.extern FUN_020097C4
	.extern FUN_0200BDE4
	.extern FUN_02012104
	.extern FUN_02012108
	.extern FUN_0201214C
	.extern FUN_02012158
	.extern FUN_02012944
	.extern FUN_02012A60
	.extern FUN_02012C18
	.extern FUN_02012FE4
	.extern FUN_02028844
	.extern FUN_0202E43C
	.extern FUN_0202E770
	.extern FUN_0202E888
	.extern FUN_02159B48
	.extern FUN_0215E31C
	.extern FUN_02161D98
	.extern FUN_0216237C
	.extern FUN_021623DC
	.extern FUN_0216CC58
	.extern Heap_AllocDebug
	.extern Heap_Free
	.extern MI_CpuCopy8

	.text
	thumb_func_start FUN_020124F4
FUN_020124F4: ; 0x020124F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	mov r1, #0xad
	str r1, [sp]
	mov r1, #0x6b
	ldr r3, _020126F8 ; =0x020A728C
	lsl r1, r1, #4
	mov r2, #1
	.hword 0xF01E, 0xE916 ; blx Heap_AllocDebug
	add r4, r0, #0
	bl FUN_020070a4
	str r0, [r4]
	bl FUN_0202E888
	mov r6, #0x71
	lsl r6, r6, #2
	strb r0, [r4, r6]
	mov r5, #0
	add r0, r6, #2
	thumb_func_end FUN_020124F4

	thumb_func_start FUN_02012520
FUN_02012520: ; 0x02012520
	strb r5, [r4, r0]
	ldr r0, [r4]
	bl FUN_02008854
	add r1, r6, #0
	sub r1, #0x68
	str r0, [r4, r1]
	add r0, r6, #0
	sub r0, #0x68
	ldr r0, [r4, r0]
	bl FUN_02008844
	add r1, r6, #0
	sub r1, #0x64
	str r0, [r4, r1]
	add r0, r6, #0
	sub r0, #0x68
	ldr r0, [r4, r0]
	bl FUN_02008844
	add r1, r6, #0
	sub r1, #0x60
	str r0, [r4, r1]
	add r0, r6, #0
	sub r0, #0x68
	ldr r0, [r4, r0]
	bl FUN_02008848
	add r1, r6, #0
	sub r1, #0x5c
	str r0, [r4, r1]
	add r0, r6, #0
	thumb_func_end FUN_02012520

	thumb_func_start FUN_02012560
FUN_02012560: ; 0x02012560
	sub r0, #0x68
	ldr r0, [r4, r0]
	bl FUN_0200884C
	add r1, r6, #0
	sub r1, #0x58
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	bl FUN_02006E40
	sub r6, #0x20
	str r0, [r4, r6]
	add r6, r4, #4
	mov r7, #0x44
_0201257C:
	add r0, r5, #0
	mul r0, r7
	add r0, r6, r0
	bl FUN_02012A60
	add r5, r5, #1
	cmp r5, #5
	blt _0201257C
	bl FUN_02008468
	add r6, r0, #0
	add r0, r4, #0
	bl FUN_02012944
	add r5, r0, #0
	ldr r0, [r4]
	bl FUN_02008730
	add r1, r5, #0
	add r2, r6, #0
	blx MI_CpuCopy8
	ldr r0, [sp, #4]
	bl FUN_0216237C
	mov r6, #0x56
	lsl r6, r6, #2
	str r0, [r4, r6]
	bl FUN_021623DC
	ldr r0, [r4]
	bl FUN_02012FE4
	add r1, r6, #0
	add r1, #0x54
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	bl FUN_02159B48
	add r1, r6, #0
	add r1, #0x58
	str r0, [r4, r1]
	ldr r0, [r4]
	mov r1, #0x33
	mov r5, #0x33
	bl FUN_020071CC
	add r2, r0, #0
	ldr r0, [sp, #4]
	mov r1, #0x40
	bl FUN_0216CC58
	add r1, r6, #0
	add r1, #0x50
	str r0, [r4, r1]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl FUN_02028844
	add r1, r6, #0
	add r1, #0x5c
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	thumb_func_end FUN_02012560
_020125FA:
	.byte 0x01, 0xF0

	thumb_func_start FUN_020125fc
FUN_020125fc: ; 0x020125FC
	thumb_func_end FUN_020125fc
_020125FC:
	.byte 0x15, 0xFF, 0x31, 0x1C
	.byte 0x60, 0x31, 0x60, 0x50, 0x01, 0x98, 0xF5, 0xF7, 0x25, 0xFE, 0x31, 0x1C, 0x34, 0x31, 0x60, 0x50
	.byte 0x20, 0x68, 0x19, 0x27

	thumb_func_start FUN_02012614
FUN_02012614: ; 0x02012614
	mov r1, #0x19
	bl FUN_020071CC
	lsl r1, r7, #4
	str r0, [r4, r1]
	ldr r0, [r4]
	mov r1, #0x1a
	mov r7, #0x1a
	bl FUN_020071CC
	add r1, r6, #0
	add r1, #0x3c
	str r0, [r4, r1]
	ldr r0, [r4]
	bl FUN_0200873c
	lsl r1, r5, #3
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	ldr r1, [r4]
	bl FUN_02007aa4
	add r1, r6, #0
	add r1, #0x44
	thumb_func_end FUN_02012614

	thumb_func_start FUN_02012644
FUN_02012644: ; 0x02012644
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	bl FUN_020097C4
	lsl r1, r7, #4
	add r6, #0x7c
	str r0, [r4, r1]
	mov r5, #0
	add r6, r4, r6
_02012656:
	lsl r0, r5, #4
	add r0, r6, r0
	bl FUN_0200BDE4
	add r5, r5, #1
	cmp r5, #4
	blt _02012656
	mov r6, #0x85
	lsl r6, r6, #2
	add r7, r4, r6
	mov r5, #0
	sub r6, #0x2c
_0201266E:
	add r0, r5, #0
	mul r0, r6
	add r0, r7, r0
	bl FUN_02161D98
	add r5, r5, #1
	thumb_func_end FUN_02012644

	non_word_aligned_thumb_func_start FUN_0201267a
FUN_0201267a: ; 0x0201267A
	cmp r5, #2
	blt _0201266E
	ldr r0, [sp, #4]
	bl FUN_0200857C
	ldr r6, _020126FC ; =0x000006AC
	mov r5, #0
	str r0, [r4, r6]
	mov r0, #7
	lsl r0, r0, #6
	str r5, [r4, r0]
	ldr r0, [r4]
	bl FUN_020071e4
	ldr r0, [sp, #4]
	bl FUN_0215E31C
	add r1, r6, #0
	sub r1, #0xc8
	str r0, [r4, r1]
	add r0, r6, #0
	sub r0, #0xc4
	add r0, r4, r0
	bl FUN_0202E43C
	add r0, r4, #0
	bl FUN_02012C18
	add r0, r6, #0
	sub r0, #0x2c
	str r5, [r4, r0]
	add r0, r6, #0
	sub r0, #0x24
	str r5, [r4, r0]
	ldr r0, [sp, #4]
	bl FUN_0202E770
	add r1, r6, #0
	sub r1, #0x28
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	ldr r1, _02012700 ; =0x00008001
	thumb_func_end FUN_0201267a
_020126CE:
	.byte 0x14, 0xF0

	thumb_func_start FUN_020126d0
FUN_020126d0: ; 0x020126D0
_020126D0:
	.byte 0x25, 0xFF, 0x31, 0x1C, 0x20, 0x39, 0x60, 0x50, 0x01, 0x99, 0x20, 0x1C, 0x52, 0xF1, 0x60, 0xF8
	.byte 0x31, 0x1C, 0x1C, 0x39, 0x60, 0x50, 0x30, 0x1C, 0x08, 0x38, 0x25, 0x50, 0x30, 0x1F, 0x25, 0x50
	.byte 0x20, 0x1C, 0x02, 0xB0, 0xF8, 0xBD, 0xC0, 0x46
_020126F8: .word 0x020A728C
_020126FC: .word 0x000006AC
_02012700: .word 0x00008001
	thumb_func_end FUN_020126d0
