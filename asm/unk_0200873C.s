	.include "asm/macros/function.inc"

	.extern FUN_020071CC
	.extern FUN_02088864
	.extern FUN_0209C2B0
	.extern MI_CpuFill8

	.text
	thumb_func_start FUN_0200873c
FUN_0200873c: ; 0x0200873C
	ldr r3, _02008744 ; =FUN_020071CC
	mov r1, #0x1b
	bx r3
	nop
_02008744: .word 0x020071CD ; was FUN_020071CC
	thumb_func_end FUN_0200873c

	thumb_func_start FUN_02008748
FUN_02008748: ; 0x02008748
	push {r3, lr}
	mov r1, #0x1b
	bl FUN_020071CC
	add r0, #0x24
	pop {r3, pc}
	thumb_func_end FUN_02008748

	thumb_func_start FUN_02008754
FUN_02008754: ; 0x02008754
	push {r3, lr}
	mov r1, #0x1b
	bl FUN_020071CC
	add r0, #0x2c
	ldrb r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end FUN_02008754

	thumb_func_start FUN_02008764
FUN_02008764: ; 0x02008764
	push {r3, lr}
	mov r1, #0x1b
	bl FUN_020071CC
	mov r1, #1
	add r0, #0x2c
	strb r1, [r0]
	pop {r3, pc}
	thumb_func_end FUN_02008764

	thumb_func_start FUN_02008774
FUN_02008774: ; 0x02008774
	push {r3, lr}
	mov r1, #0x1b
	bl FUN_020071CC
	mov r1, #0
	add r0, #0x2c
	strb r1, [r0]
	pop {r3, pc}
	thumb_func_end FUN_02008774

	thumb_func_start FUN_02008784
FUN_02008784: ; 0x02008784
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x1b
	bl FUN_020071CC
	lsl r1, r4, #1
	add r0, r0, r1
	ldrh r1, [r0, #0x30]
	ldr r0, _020087A4 ; =0x0000C21E
	cmp r1, r0
	bne _0200879E
	mov r0, #1
	pop {r4, pc}
_0200879E:
	mov r0, #0
	pop {r4, pc}
	nop
_020087A4: .word 0x0000C21E
	thumb_func_end FUN_02008784

	thumb_func_start FUN_020087A8
FUN_020087A8: ; 0x020087A8
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x1b
	bl FUN_020071CC
	lsl r1, r4, #1
	ldr r2, _020087BC ; =0x0000C21E
	add r0, r0, r1
	strh r2, [r0, #0x30]
	pop {r4, pc}
	.balign 4, 0
_020087BC: .word 0x0000C21E
	thumb_func_end FUN_020087A8
_020087C0:
	.byte 0x10, 0xB5, 0x0C, 0x1C, 0x1B, 0x21, 0xFE, 0xF7, 0x01, 0xFD, 0x61, 0x00, 0x00, 0x22, 0x40, 0x18
	.byte 0x02, 0x86, 0x10, 0xBD

	thumb_func_start thunk_FUN_02008216
thunk_FUN_02008216: ; 0x020087D4
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x1b
	bl FUN_020071CC
	add r0, #0x44
	lsl r1, r4, #2
	add r0, r0, r1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end thunk_FUN_02008216

	thumb_func_start FUN_020087E8
FUN_020087E8: ; 0x020087E8
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x1b
	bl FUN_020071CC
	add r4, #0x20
	add r2, r0, #4
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	pop {r4, pc}
	thumb_func_end FUN_020087E8

	thumb_func_start FUN_02008808
FUN_02008808: ; 0x02008808
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x1b
	bl FUN_020071CC
	add r2, r0, #4
	add r4, #0x20
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	pop {r4, pc}
	thumb_func_end FUN_02008808
_02008828:
	.byte 0x9C, 0x20, 0x70, 0x47, 0x10, 0xB5, 0x00, 0x21
	.byte 0x9C, 0x22, 0x04, 0x1C, 0x7A, 0xF0, 0xCA, 0xE9, 0x01, 0x48, 0x76, 0x34, 0x20, 0x80, 0x10, 0xBD
	.byte 0xAB, 0x01, 0x00, 0x00
