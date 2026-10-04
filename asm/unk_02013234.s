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
