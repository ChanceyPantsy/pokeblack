	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_020071ec
	.extern FUN_02009864
	.extern FUN_020099D4
	.extern FUN_02009A1C
	.extern FUN_0200A400
	.extern FUN_0200A418
	.extern FUN_0200A480
	.extern FUN_020597C8
	.extern FUN_021DFC20
	.extern FUN_021DFE90
	.extern FUN_021DFEAC

	.text
_0200A41C:
	.byte 0x08, 0xB5, 0x41, 0x68
	.byte 0x00, 0x29, 0x02, 0xD0, 0x01, 0x29, 0x03, 0xD0, 0x05, 0xE0, 0xFF, 0xF7, 0xF5, 0xFF, 0x08, 0xBD
	.byte 0xFF, 0xF7, 0xF2, 0xFF

	thumb_func_start FUN_0200a434
FUN_0200a434: ; 0x0200A434
	pop {r3, pc}
	thumb_func_end FUN_0200a434
_0200A436:
	.byte 0x00, 0x20, 0x08, 0xBD, 0x00, 0x00
