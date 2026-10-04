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

	.text
_02016380:
	.byte 0x51, 0x22, 0x92, 0x00, 0x83, 0x58, 0x01, 0x21, 0x8B, 0x43, 0x01, 0x21, 0x19, 0x43, 0x81, 0x50
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start FUN_02016394
FUN_02016394: ; 0x02016394
	push {r3, r4}
	mov r3, #5
	lsl r3, r3, #6
	ldr r4, [r0, r3]
	ldr r2, _020163AC ; =0xBFFFFFFF
	lsl r1, r1, #0x1f
	and r2, r4
	lsr r1, r1, #1
	orr r1, r2
	str r1, [r0, r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_020163AC: .word 0xBFFFFFFF
	thumb_func_end FUN_02016394
_020163B0:
	.byte 0x81, 0x64, 0x70, 0x47, 0xC3, 0x6A

	non_word_aligned_thumb_func_start FUN_020163b6
FUN_020163b6: ; 0x020163B6
	mov r2, #2
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x1e
	orr r1, r3
	str r1, [r0, #0x2c]
	bx lr
	thumb_func_end FUN_020163b6

	thumb_func_start FUN_020163C4
FUN_020163C4: ; 0x020163C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #4]
	add r7, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [r7, #0x14]
	lsl r0, r0, #2
	ldr r4, [r1, r0]
	add r0, r2, #0
	ldr r0, [r0, #0x20]
	str r2, [sp, #0x10]
	cmp r0, #1
	bne _020163F6
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _0201661C ; =0x00007FFF
	and r1, r0
	add r0, r0, #1
	orr r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	b _020163FC
_020163F6:
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r4, r0]
_020163FC:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r7]
	cmp r0, #0
	beq _02016420
	ldr r0, [sp, #0x10]
	ldr r1, [r7, #4]
	ldr r0, [r0]
	cmp r1, r0
	bne _02016420
	ldr r1, [sp, #4]
	ldr r2, [sp, #0x10]
	add r0, r7, #0
	bl FUN_02016630
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02016420:
	mov r5, #5
	lsl r5, r5, #6
	ldr r1, [r4, r5]
	ldr r0, _02016620 ; =0xFFFFDFFF
	and r0, r1
	str r0, [r4, r5]
	add r0, r4, #0
	add r0, #0x9c
	blx FUN_02063790
	add r0, r4, #0
	add r0, #0xc0
	blx FUN_020637D4
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r3, r4, #0
	ldr r0, [r0]
	ldr r1, [r1, #0xc]
	mov r2, #0
	add r3, #0x10
	.hword 0xF033, 0xEDB6 ; blx FUN_02049FBC
	str r0, [r4, #0xc]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	mov r2, #1
	add r3, r4, #0
	str r2, [sp, #8]
	ldr r0, [r0]
	ldr r1, [r1, #0x10]
	mov r2, #1
	add r3, #0x20
	.hword 0xF033, 0xEDE8 ; blx FUN_0204A03C
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r3, r4, #0
	ldr r0, [r0]
	ldr r1, [r1, #0x14]
	mov r2, #0
	add r3, #0x18
	.hword 0xF033, 0xEE1C ; blx FUN_0204A0BC
	str r0, [r4, #0x14]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r3, r4, #0
	ldr r0, [r0]
	ldr r1, [r1, #0x18]
	mov r2, #0
	add r3, #0x28
	.hword 0xF033, 0xEE50 ; blx FUN_0204A13C
	str r0, [r4, #0x24]
	add r0, r4, #0
	mov r1, #0
	bl FUN_02016028
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	ldr r1, [r1, #0x1c]
	ldr r2, [sp, #0xc]
	.hword 0xF032, 0xED56 ; blx FUN_02048F60
	str r0, [r4, #0x2c]
	ldr r2, [r0]
	mov r1, #0x30
	add r3, r2, #0
	mul r3, r1
	add r3, #0xc
	mov r1, #3
	bic r3, r1
	add r0, r0, r3
	str r0, [r4, #0x30]
	mov r0, #0x21
	thumb_func_end FUN_020163C4

	thumb_func_start thunk_FUN_02016c00
thunk_FUN_02016c00: ; 0x020164CC
	lsl r0, r0, #6
	add r5, #0xc
	str r0, [sp]
	ldr r0, [r4, r5]
	ldr r3, _02016624 ; =0x020A72CC
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _02016620 ; =0xFFFFDFFF
	mov r2, #1
	lsr r0, r0, #0x11
	and r1, r0
	ldr r0, [sp, #8]
	lsl r0, r0, #0xf
	orr r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0x2c
	.hword 0xF01A, 0xE922 ; blx Heap_AllocDebug
	add r5, r0, #0
	str r7, [r5, #0x20]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _02016500
	mov r0, #0
	str r0, [sp, #8]
_02016500:
	ldr r0, [sp, #8]
	mov r2, #1
	str r0, [r5, #0x28]
	add r0, r4, #0
	add r0, #0x9c
	str r0, [r5, #8]
	add r0, r4, #0
	add r0, #0xc0
	str r0, [r5, #0xc]
	ldr r0, [sp, #4]
	ldr r1, [r7, #0x30]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [r5, #0x18]
	ldr r0, [sp, #4]
	ldr r1, [r7, #0x34]
	lsl r0, r0, #5
	add r0, r1, r0
	str r0, [r5, #0x1c]
	mov r0, #0x53
	str r4, [r5, #0x24]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r3, r5, #0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _0201661C ; =0x00007FFF
	and r1, r0
	add r0, r0, #1
	orr r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	ldr r1, [r1, #4]
	.hword 0xF033, 0xEC34 ; blx FUN_02049DB4
	mov r3, #0x53
	str r0, [r5, #0x10]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [sp, #0x10]
	lsl r3, r3, #0x10
	lsr r6, r3, #0x10
	ldr r3, _0201661C ; =0x00007FFF
	ldr r1, [sp, #0x10]
	and r3, r6
	mov ip, r3
	mov r3, #1
	lsl r6, r3, #0xf
	mov r3, ip
	orr r3, r6
	lsl r3, r3, #0x10
	ldr r0, [r0]
	ldr r1, [r1, #8]
	add r2, r5, #4
	lsr r3, r3, #0x10
	.hword 0xF033, 0xECDE ; blx FUN_02049F34
	str r0, [r5, #0x14]
	ldr r0, _02016628 ; =0x00000858
	ldr r3, _02016624 ; =0x020A72CC
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [sp, #0xc]
	ldr r1, [r1, #8]
	mov r2, #0
	.hword 0xF01A, 0xE8D4 ; blx Heap_AllocDebug
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	ldr r0, _02016628 ; =0x00000858
	ldr r3, _02016624 ; =0x020A72CC
	add r0, r0, #1
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [sp, #0xc]
	ldr r1, [r1, #8]
	mov r2, #0
	blx Heap_AllocDebug
	add r1, r4, #0
	add r1, #0xd8
	str r0, [r1]
	ldr r0, [r5, #4]
	ldr r1, [r0, #8]
	add r0, r4, #0
	add r0, #0xdc
	str r1, [r0]
	ldr r2, [r5, #4]
	add r1, r4, #0
	add r1, #0xd4
	ldr r0, [r2, #0xc]
	ldr r1, [r1]
	ldr r2, [r2, #8]
	blx FUN_02082A60
	ldr r3, [r7, #0x38]
	cmp r3, #0
	beq _020165E0
	thumb_func_end thunk_FUN_02016c00
FUN_020165ce: ; 0x020165CE
	.byte 0x04, 0x98
	.byte 0xFA, 0x6B, 0x29, 0x1C, 0x98, 0x47, 0x01, 0x28, 0x02, 0xD1, 0x00, 0x20, 0xB8, 0x63, 0xF8, 0x63
_020165E0:
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	lsr r0, r0, #0x1c
	beq _020165F4
	add r0, r4, #0
	add r1, r5, #0
	bl FUN_02016C60
_020165F4:
	ldr r0, [r7, #8]
	cmp r0, #0

	thumb_func_start FUN_020165f8
FUN_020165f8: ; 0x020165F8
	beq _0201660A
	ldr r1, _0201662C ; =0x02016881
	add r2, r5, #0
	mov r3, #0
	blx FUN_02030DA8
	add sp, #0x14
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0201660A:
	ldr r0, _0201662C ; =0x02016881
	add r1, r5, #0
	mov r2, #0
	bl FUN_020056A0
	str r0, [r4]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0201661C: .word 0x00007FFF
_02016620: .word 0xFFFFDFFF
_02016624: .word 0x020A72CC
_02016628: .word 0x00000858
_0201662C: .word 0x02016881
	thumb_func_end FUN_020165f8
