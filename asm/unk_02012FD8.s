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

	.global _02012FD8

	.text
_02012FD8:
	.byte 0x00, 0x68, 0x01, 0x4B, 0x43, 0x21, 0x18, 0x47
	.byte 0xCD, 0x71, 0x00, 0x02
