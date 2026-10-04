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
_02012EC0:
	.byte 0x00, 0x68, 0x70, 0x47, 0x01, 0x49, 0x40, 0x18, 0x70, 0x47, 0xC0, 0x46, 0xEC, 0x05, 0x00, 0x00
	.byte 0x1A, 0x21, 0x89, 0x01, 0x40, 0x18, 0x70, 0x47, 0x01, 0x49, 0x40, 0x58, 0x70, 0x47, 0xC0, 0x46
	.byte 0x88, 0x06, 0x00, 0x00, 0x01, 0x4A, 0x81, 0x50, 0x70, 0x47, 0xC0, 0x46, 0x88, 0x06, 0x00, 0x00
	.byte 0x00, 0x68

	non_word_aligned_thumb_func_start FUN_02012ef2
FUN_02012ef2: ; 0x02012EF2
	ldr r3, _02012EF8 ; =FUN_020071CC
	mov r1, #0x3a
	bx r3
	.balign 4, 0
_02012EF8: .word 0x020071CD ; was FUN_020071CC
	thumb_func_end FUN_02012ef2
_02012EFC:
	.byte 0x00, 0x68, 0x01, 0x4B
	.byte 0x3B, 0x21, 0x18, 0x47, 0xCD, 0x71, 0x00, 0x02

	thumb_func_start FUN_02012F08
FUN_02012F08: ; 0x02012F08
	ldr r0, [r0]
	ldr r3, _02012F10 ; =FUN_0200c0f0
	bx r3
	nop
_02012F10: .word 0x0200C0F1 ; was FUN_0200c0f0
	thumb_func_end FUN_02012F08
_02012F14:
	.byte 0x00, 0x68, 0x01, 0x4B, 0x18, 0x47, 0xC0, 0x46, 0xC9, 0x9E, 0x00, 0x02
