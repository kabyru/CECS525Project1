	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"P1-3A.c"
	.text
	.align	2
	.global	next_char
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	next_char, %function
next_char:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]! //Push sp. Save the caller’s frame.
	add	fp, sp, #0 //Allocate 0 bytes for this function’s frame.
	sub	sp, sp, #12 //Allocate 12 bytes on the stack.
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]
	add	r3, r3, #1 //Increment 1
	uxtb	r3, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4 //Load into fp register from location where the stack pointer is pointing
     //then increment the stack by 4. Effectively POP {fp}
     //Used to restore parent stack frame.
	bx	lr //return
	.size	next_char, .-next_char
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Next Character= %c\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr} //Save return address and frame.
	add	fp, sp, #4 //Set frame. Only value is previous frame.
			     //Useless, since values aren’t spilled to the stack.
	mov	r0, #65 //First parameter for next_char.
	bl	next_char //call next_char.
	mov	r3, r0 //Mov return of next_char into r3.
	mov	r1, r3 //Mov r3 into second parameter of printf.
	ldr	r0, .L4 //Load pointer to format string of printf into first parameter.
	bl	printf //call printf
	nop
	pop	{fp, pc} //Restore frame and return.
.L5:
	.align	2
.L4:
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits

