	.include "asm/macros/function.inc"

	.extern FUN_02007248
	.extern FUN_0200E27C
	.extern FUN_02167358
	.extern FUN_0216736C
	.extern FUN_02167380
	.extern MI_CpuCopy8

	.text
	thumb_func_start FUN_0200E024
FUN_0200E024: ; 0x0200E024
	push {r3, r4, r5, lr}
	ldr r1, _0200E060 ; =0x02FFFC3C
	add r5, r0, #0
	ldr r0, [r1]
	thumb_func_end FUN_0200E024

	thumb_func_start FUN_0200e02c
FUN_0200e02c: ; 0x0200E02C
	ldr r1, [r1]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0200E064 ; =0x0000084E
	strh r1, [r5, r0]
	ldrh r1, [r5, r0]
	cmp r1, #0
	bne _0200E040
	mov r1, #1
	strh r1, [r5, r0]
_0200E040:
	ldr r4, _0200E068 ; =0x0000084C
	add r0, r5, #0
	add r1, r4, #0
	.hword 0xF031, 0xE95A ; blx FUN_0203F2FC
	strh r0, [r5, r4]
	add r3, r4, #2
	ldrh r3, [r5, r3]
	ldrh r2, [r5, r4]
	add r0, r5, #0
	lsl r3, r3, #0x10
	add r1, r4, #0
	add r2, r2, r3
	.hword 0xF031, 0xE966 ; blx FUN_0203F328
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0200E060: .word 0x02FFFC3C
_0200E064: .word 0x0000084E
_0200E068: .word 0x0000084C
	thumb_func_end FUN_0200e02c

	thumb_func_start FUN_0200E06C
FUN_0200E06C: ; 0x0200E06C
	push {r3, r4, r5, lr}
	ldr r4, _0200E08C ; =0x0000084C
	add r5, r0, #0
	add r3, r4, #2
	ldrh r3, [r5, r3]
	ldrh r2, [r5, r4]
	add r1, r4, #0
	lsl r3, r3, #0x10
	add r2, r2, r3
	thumb_func_end FUN_0200E06C
_0200E07E:
	.byte 0x31, 0xF0

	thumb_func_start FUN_0200e080
FUN_0200e080: ; 0x0200E080
	.hword 0xE97E
	mov r1, #0
	add r0, r4, #2
	strh r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_0200E08C: .word 0x0000084C
	thumb_func_end FUN_0200e080
