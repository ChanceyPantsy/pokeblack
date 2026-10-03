	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_020072A4
	.extern FUN_020072CC
	.extern FUN_0200B888
	.extern FUN_0200B8AC
	.extern Heap_AllocDebug
	.extern MI_CpuCopy8
	.extern MI_CpuFill8

	.global _0200B438

	.text
_0200B438:
	.byte 0x00, 0x4B, 0x18, 0x47, 0xB0, 0x07, 0x03, 0x02
	.byte 0x00, 0x48, 0x70, 0x47, 0xA4, 0x18, 0x00, 0x00
