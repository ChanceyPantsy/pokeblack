	.include "asm/macros/function.inc"

	.extern FUN_02007248
	.extern FUN_0200E024
	.extern FUN_0200E06C
	.extern FUN_0200E27C
	.extern FUN_02167358
	.extern FUN_0216736C
	.extern FUN_02167380
	.extern MI_CpuCopy8

	.text
_0200E458:
	.byte 0x49, 0x00, 0x40, 0x5A, 0x70, 0x47, 0x00, 0x00

	thumb_func_start FUN_0200E460
FUN_0200E460: ; 0x0200E460
	lsl r1, r1, #1
	ldrh r3, [r0, r1]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	add r2, r3, r2
	strh r2, [r0, r1]
	ldrh r3, [r0, r1]
	ldr r2, _0200E478 ; =0x0000270F
	cmp r3, r2
	bls _0200E476
	strh r2, [r0, r1]
_0200E476:
	bx lr
	.balign 4, 0
_0200E478: .word 0x0000270F
	thumb_func_end FUN_0200E460
_0200E47C:
	.byte 0x89, 0x00, 0x40, 0x18
	.byte 0xDC, 0x30, 0x00, 0x68, 0x70, 0x47, 0x00, 0x00

	thumb_func_start FUN_0200E488
FUN_0200E488: ; 0x0200E488
	push {r4, lr}
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r4, r1, #0
	bl FUN_0216736C
	sub r1, r4, #1
	add r0, r0, r1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FUN_0200E488

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
