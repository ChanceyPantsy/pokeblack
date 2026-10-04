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
	thumb_func_start FUN_02012704
FUN_02012704: ; 0x02012704
	push {r3, r4, r5, lr}
	ldr r5, _02012794 ; =0x000006AC
	add r4, r0, #0
	ldr r0, [r4, r5]
	blx Heap_Free
	add r0, r5, #0
	sub r0, #0x1c
	ldr r0, [r4, r0]
	bl FUN_021647D8
	add r0, r5, #0
	sub r0, #0x20
	ldr r0, [r4, r0]
	bl FUN_02027584
	add r0, r5, #0
	sub r0, #0x28
	ldr r0, [r4, r0]
	bl FUN_0202E794
	sub r5, #0xc8
	ldr r0, [r4, r5]
	bl FUN_0215E334
	mov r5, #0x69
	lsl r5, r5, #2
	ldr r0, [r4, r5]
	bl FUN_02006E64
	sub r0, r5, #4
	ldr r0, [r4, r0]
	blx Heap_Free
	add r0, r5, #0
	sub r0, #8
	ldr r0, [r4, r0]
	bl FUN_02007AC8
	add r0, r5, #0
	sub r0, #0x18
	ldr r0, [r4, r0]
	blx Heap_Free
	add r0, r5, #4
	ldr r0, [r4, r0]
	bl FUN_0216CCB0
	add r0, r5, #0
	add r0, #0xc
	ldr r0, [r4, r0]
	bl FUN_02159BBC
	add r0, r5, #0
	sub r0, #0x4c
	ldr r0, [r4, r0]
	bl FUN_021623BC
	add r0, r5, #0
	add r0, #0x14
	ldr r0, [r4, r0]
	thumb_func_end FUN_02012704
_0201277E:
	.byte 0x01, 0xF0

	thumb_func_start FUN_02012780
FUN_02012780: ; 0x02012780
	.hword 0xFE61
	add r5, #0x10
	ldr r0, [r4, r5]
	bl FUN_0202889C
	add r0, r4, #0
	blx Heap_Free
	pop {r3, r4, r5, pc}
	nop
_02012794: .word 0x000006AC
	thumb_func_end FUN_02012780
_02012798:
	.byte 0x02, 0x1D, 0x44, 0x20, 0x48, 0x43, 0x10, 0x18
	.byte 0x70, 0x47, 0x00, 0x00
