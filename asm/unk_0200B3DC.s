	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_020072A4
	.extern FUN_020072CC
	.extern FUN_0200B448
	.extern FUN_0200B888
	.extern FUN_0200B8AC
	.extern Heap_AllocDebug
	.extern MI_CpuCopy8
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_0200B3DC
FUN_0200B3DC: ; 0x0200B3DC
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0x67
	str r1, [sp]
	mov r1, #2
	ldr r3, _0200B3FC ; =0x020A71C4
	lsl r1, r1, #0xc
	mov r2, #1
	blx Heap_AllocDebug
	add r4, r0, #0
	bl FUN_0200B448
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0200B3FC: .word 0x020A71C4
	thumb_func_end FUN_0200B3DC
_0200B400:
	.byte 0x38, 0xB5, 0x07, 0x4D, 0x04, 0x1C, 0x28, 0x68, 0x00, 0x28, 0x03, 0xD0, 0x25, 0xF0, 0xD0, 0xE9
	.byte 0x00, 0x20, 0x28, 0x60, 0x20, 0x1C, 0xFF, 0xF7, 0xE1, 0xFF, 0x01, 0x49, 0x08, 0x60, 0x38, 0xBD
	.byte 0x6C, 0x61, 0x14, 0x02
