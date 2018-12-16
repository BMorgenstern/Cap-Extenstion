.thumb

@80 HP Cap
.org 0x181E2
	.byte 80
.org 0x181EE
	.byte 80
.org 0x2BF4C
	.byte 80
.org 0x2BF64
	.byte 80
.org 0xA474C

	@saves the class ID
	bx      r14
	lsl     r0,r0,#0x0
	StoreClass:
	lsl     r0,r0,#0x4
	ldr     r1,[pc,#0x34]
	add     r0,r1,r0
	strb    r2,[r0,#0x3]
	bx      r14
	@loads the class pointer back
	LoadClass:
	@accepts a pointer to a Character object as a parameter
	push    {r14}
	cmp     r0,#0x0
	beq     GetClassPtr
	ldr     r1,[sp,#0x38]
	ldrb    r0,[r0,#0x4]
	lsl     r0,r0,#0x4
	add     r0,r1,r0
	ldr     r1,DataSize
	add     r0,r1,r0
	ldrb    r0,[r0,#0x3]
	GetClassPtr:
	bl      0x8019446
	pop     {r15}
	DataSize:
	.word 0x83C

@load HP back
.org 0xA5356
	mov		r0,r7
	ldrb	r1,[r0,#0x12]
	
.org 0xA53E2
	@this block stores the full 8 bit class ID
	ldr     r2,[r7,#0x4]
	ldrb    r2,[r2,#0x4]
	mov     r6,#0x3F
	ldr     r0,[r7]
	cmp     r0,#0x0
	beq     L1
	ldrb    r0,[r0,#0x4]
	bl      StoreClass
	@procedurally loops through storing 6 bit stats
	L1:
	mov     r0,#0x0
	mov     r1,#0x0
	L2:
	mov     r2,#0x14
	mov     r5,#0x1F
	add     r2,r2,r1
	ldsb    r2,[r7,r2]
	and     r2,r6
	mov     r3,#0x6
	mul     r3,r1
	add     r3,#0x4
	lsl     r2,r3
	orr     r0,r2
	add     r1,#0x1
	cmp     r1,#0x4
	blt     L2
	mov     r1,r4
	strb    r0,[r4,#0x5]
	lsr     r0,r0,#0x8
	strb    r0,[r4,#0x6]
	lsr     r0,r0,#0x8
	strb    r0,[r4,#0x7]
	lsr     r0,r0,#0x8
	ldrb    r2,[r7,#0x18]
	and     r2,r6
	lsl     r2,r2,#0x4
	orr     r0,r2
	ldrb    r2,[r7,#0x19]
	and     r2,r6
	lsl     r2,r2,#0xA
	orr     r0,r2
	strh    r0,[r4,#0x8]
	mov     r3,r13
	b       0x80A5484
	
@write the HP back on load
.org 0xA57BC
	nop
	nop
	strb	r0,[r4,#0x12]
	
@writes the 6 bit stats back upon load
.org 0xA57E8
	ldr     r0,[r4]
	bl      LoadClass
	str     r0,[r4,#0x4]
	ldr     r0,[sp,#0x4]
	lsr     r0,r0,#0xC
	mov     r2,#0x3F
	mov     r1,r0
	and     r1,r2
	strb    r1,[r4,#0x14]
	lsr     r0,r0,#0x6
	mov     r1,r0
	and     r1,r2
	strb    r1,[r4,#0x15]
	lsr     r0,r0,#0x6
	mov     r1,r0
	and     r1,r2
	strb    r1,[r4,#0x16]
	mov     r1,#0x8
	ldr     r1,[sp,#0x8]
	lsl     r1,r1,#0x8
	orr     r0,r1
	lsr     r0,r0,#0x6
	mov     r1,r0
	and     r1,r2
	strb    r1,[r4,#0x17]
	lsr     r0,r0,#0x6
	mov     r1,r0
	and     r1,r2
	strb    r1,[r4,#0x18]
	lsr     r0,r0,#0x6
	strb    r0,[r4,#0x19]
	mov     r5,#0x1
	mov     r0,r13
	nop
	nop
	nop