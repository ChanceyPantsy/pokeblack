	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_02088864
	.extern FUN_0209C2B0
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_0200857C
FUN_0200857C: ; 0x0200857C
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0x20
	str r1, [sp]
	ldr r3, _0200859C ; =0x020A70B8
	mov r1, #8
	mov r2, #1
	.hword 0xF028, 0xE8D4 ; blx Heap_AllocDebug
	add r4, r0, #0
	bl FUN_020085A0
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0200859C: .word 0x020A70B8
	thumb_func_end FUN_0200857C

	thumb_func_start FUN_020085A0
FUN_020085A0: ; 0x020085A0
	mov r1, #0
	ldr r2, [r0, #4]
	strh r1, [r0]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	mov r1, #0x7f
	bic r2, r1
	ldr r1, _020085C4 ; =0xFFFFF87F
	and r2, r1
	ldr r1, _020085C8 ; =0xFFFF07FF
	and r2, r1
	ldr r1, _020085CC ; =0xFFE0FFFF
	and r2, r1
	ldr r1, _020085D0 ; =0xF81FFFFF
	and r1, r2
	str r1, [r0, #4]
	bx lr
	nop
_020085C4: .word 0xFFFFF87F
_020085C8: .word 0xFFFF07FF
_020085CC: .word 0xFFE0FFFF
_020085D0: .word 0xF81FFFFF
	thumb_func_end FUN_020085A0

	thumb_func_start FUN_020085D4
FUN_020085D4: ; 0x020085D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r6, [r5]
	ldr r0, _02008638 ; =0x000003E7
	cmp r6, r0
	bne _020085EC
	ldrb r0, [r5, #2]
	cmp r0, #0x3b
	bne _020085EC
	ldrb r0, [r5, #3]
	cmp r0, #0x3b
	beq _02008634
_020085EC:
	ldrb r0, [r5, #3]
	ldrb r4, [r5, #2]
	add r7, r0, r1
	cmp r7, #0x3b
	bls _0200862E
	add r0, r7, #0
	mov r1, #0x3c
	.hword 0xF093, 0xEE5A ; blx FUN_0209C2B0
	add r4, r4, r0
	add r0, r7, #0
	mov r1, #0x3c
	blx FUN_0209C2B0
	add r7, r1, #0
	cmp r4, #0x3b
	bls _0200862E
	add r0, r4, #0
	mov r1, #0x3c
	.hword 0xF093, 0xEE4E ; blx FUN_0209C2B0
	add r6, r6, r0
	add r0, r4, #0
	thumb_func_end FUN_020085D4

	non_word_aligned_thumb_func_start FUN_0200861a
FUN_0200861a: ; 0x0200861A
	mov r1, #0x3c
	blx FUN_0209C2B0
	ldr r0, _02008638 ; =0x000003E7
	add r4, r1, #0
	cmp r6, r0
	blo _0200862E
	add r6, r0, #0
	mov r4, #0x3b
	mov r7, #0x3b
_0200862E:
	strh r6, [r5]
	strb r4, [r5, #2]
	strb r7, [r5, #3]
_02008634:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02008638: .word 0x000003E7
	thumb_func_end FUN_0200861a

	thumb_func_start FUN_0200863C
FUN_0200863C: ; 0x0200863C
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	ldr r3, _02008648 ; =MI_CpuCopy8
	mov r2, #8
	bx r3
	.balign 4, 0
_02008648: .word 0x02082D44 ; was MI_CpuCopy8
	thumb_func_end FUN_0200863C
