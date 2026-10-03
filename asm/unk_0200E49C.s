	.include "asm/macros/function.inc"

	.extern FUN_02007248
	.extern FUN_0200E024
	.extern FUN_0200E06C
	.extern FUN_0200E27C
	.extern FUN_0200E488
	.extern FUN_02167358
	.extern FUN_0216736C
	.extern FUN_02167380
	.extern MI_CpuCopy8

	.text
	thumb_func_start FUN_0200E49C
FUN_0200E49C: ; 0x0200E49C
	push {r3, lr}
	bl FUN_0200E4B0
	cmp r0, #0x63
	blo _0200E4AA
	mov r0, #1
	pop {r3, pc}
_0200E4AA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end FUN_0200E49C

	thumb_func_start FUN_0200E4B0
FUN_0200E4B0: ; 0x0200E4B0
	push {r4, lr}
	add r4, r0, #0
	cmp r2, #0
	bne _0200E4BC
	mov r0, #0
	pop {r4, pc}
_0200E4BC:
	add r0, r1, #0
	add r1, r2, #0
	bl FUN_0200E488
	add r0, r4, r0
	add r0, #0x3c
	ldrb r0, [r0]
	pop {r4, pc}
	thumb_func_end FUN_0200E4B0
