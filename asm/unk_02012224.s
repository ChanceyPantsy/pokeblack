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
	.extern FUN_020124E4
	.extern FUN_020124F0
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
	thumb_func_start FUN_02012224
FUN_02012224: ; 0x02012224
	bl FUN_0201214C
	cmp r0, #0
	beq _02012246
	add r0, r4, #0
	mov r1, #0
	bl FUN_02012158
	add r0, r4, #0
	add r0, #0x33
	ldrb r1, [r0]
	mov r0, #1
	add r4, #0x33
	bic r1, r0
	thumb_func_end FUN_02012224

	thumb_func_start FUN_02012240
FUN_02012240: ; 0x02012240
	mov r0, #1
	orr r0, r1
	strb r0, [r4]
_02012246:
	pop {r4, pc}
	thumb_func_end FUN_02012240

	thumb_func_start FUN_02012248
FUN_02012248: ; 0x02012248
	add r1, r0, #0
	ldr r0, _02012250 ; =0x02012221
	ldr r3, _02012254 ; =FUN_02035138
	bx r3
	.balign 4, 0
_02012250: .word 0x02012221
_02012254: .word 0x02035138 ; was FUN_02035138
	thumb_func_end FUN_02012248
_02012258:
	.byte 0x01, 0x4B, 0x00, 0x20, 0x00, 0x21, 0x18, 0x47
	.byte 0x38, 0x51, 0x03, 0x02, 0x10, 0xB5, 0x04, 0x1C, 0xFF, 0xF7, 0x66, 0xFF, 0x14, 0xF0, 0xF2, 0xF8
	.byte 0x00, 0x28, 0x01, 0xD0, 0x01, 0x20, 0x10, 0xBD, 0x2B, 0xF0, 0xE8, 0xEB, 0x00, 0x28, 0x01, 0xD0
	.byte 0x01, 0x20, 0x10, 0xBD, 0x23, 0xF0, 0x94, 0xE8, 0x00, 0x28, 0x01, 0xD0, 0x00, 0x20, 0x10, 0xBD
	.byte 0x20, 0x1C, 0xFF, 0xF7, 0x5B, 0xFF, 0x00, 0x28, 0x01, 0xD0, 0x01, 0x20, 0x10, 0xBD, 0x00, 0x20
	.byte 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_020122A4
FUN_020122A4: ; 0x020122A4
	add r1, r0, #0
	ldr r0, _020122AC ; =0x02012265
	ldr r3, _020122B0 ; =FUN_02035064
	bx r3
	.balign 4, 0
_020122AC: .word 0x02012265
_020122B0: .word 0x02035064 ; was FUN_02035064
	thumb_func_end FUN_020122A4
_020122B4:
	.byte 0x01, 0x4B, 0x00, 0x20, 0x00, 0x21, 0x18, 0x47, 0x64, 0x50

	non_word_aligned_thumb_func_start FUN_020122be
FUN_020122be: ; 0x020122BE
	lsl r3, r0, #8
	thumb_func_end FUN_020122be

	thumb_func_start FUN_020122C0
FUN_020122C0: ; 0x020122C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r3, [sp, #4]
	mov r0, #0x37
	add r6, r1, #0
	thumb_func_end FUN_020122C0

	thumb_func_start FUN_020122cc
FUN_020122cc: ; 0x020122CC
	add r7, r2, #0
	str r0, [sp]
	ldr r3, _02012300 ; =0x020A727C
	mov r0, #4
	mov r1, #0x14
	mov r2, #1
	blx Heap_AllocDebug
	add r4, r0, #0
	str r6, [r4]
	str r7, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #0x3b
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r3, _02012300 ; =0x020A727C
	mov r0, #4
	mov r2, #1
	.hword 0xF01E, 0xEA20 ; blx Heap_AllocDebug
	str r0, [r4, #0xc]
	thumb_func_end FUN_020122cc

	thumb_func_start FUN_020122f8
FUN_020122f8: ; 0x020122F8
	str r5, [r4, #0x10]
	add r0, r4, #0
	add sp, #8
	thumb_func_end FUN_020122f8

	non_word_aligned_thumb_func_start FUN_020122fe
FUN_020122fe: ; 0x020122FE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02012300: .word 0x020A727C
	thumb_func_end FUN_020122fe
