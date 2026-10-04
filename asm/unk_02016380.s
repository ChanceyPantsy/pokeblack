	.include "asm/macros/function.inc"

	.extern FUN_020056A0
	.extern FUN_02016028
	.extern FUN_02016630
	.extern FUN_02016984
	.extern FUN_02016BA0
	.extern FUN_02016C0C
	.extern FUN_02016C38
	.extern FUN_02016C60
	.extern FUN_02030DA8
	.extern FUN_02063790
	.extern FUN_020637D4
	.extern FUN_0206469C
	.extern FUN_02082A60
	.extern Heap_AllocDebug
	.extern Heap_Free

	.global _02016380

	.text
_02016380:
	.byte 0x51, 0x22, 0x92, 0x00, 0x83, 0x58, 0x01, 0x21, 0x8B, 0x43, 0x01, 0x21, 0x19, 0x43, 0x81, 0x50
	.byte 0x70, 0x47, 0x00, 0x00
