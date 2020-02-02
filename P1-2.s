	.arch armv6 //Specifies the architecture used for this assembly file. ArmV6.
	.eabi_attribute 28, 1 //Sets EABI object attribute tags.
	.eabi_attribute 20, 1 //This could include CPU_raw_name, Tag_CPU_name, Tag_CPU_arch, Tag_CPU_arch_profile, Tag_ARM_ISA_use, Tag_THUMB_ISA_use, among other things.
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"P1-2.c" //Declares the source file of this assembly listing.
	.text //Declares that this section contains the source code.
	.comm	var,4,4 //Allocates storage in the data section. Used for dynamic memory
	.align	2 //The ALIGN directive aligns the current location to a specified boundary by padding with zeros or NOP instructions
	.global	swap //Declares the swap variable in the assembly listing.
	.arch armv6 //Declares the architecture compiled on, (ARMv6 RPi)
	.syntax unified //Sets the instruction set to be the Unified ARM instruction set.
	.arm //Defined the instruction set being generated: This does the same action as '.code 32'
	.fpu vfp //Defines the floating point unit to assemble for. VFP is designated
	.type	swap, %function //Declares the type for swap, which is a function.
swap:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!   	//Store value of fp (frame pointer) into an address equal to the sum of sp (stack pointer) and -4.   
	add	fp, sp, #0 // adds sp and 0, and stores the result into fp
	sub	sp, sp, #20 //subtract current stack pointer pointer value by 20 and store value
	str	r0, [fp, #-16] // Store value at address -16 offset from fp into r0
	str	r1, [fp, #-20] //Store value at address -20 offset from fp into r1
	ldr	r3, [fp, #-16] //Load value at address -16 offset from fp into r3
	ldr	r3, [r3] //Load r3 with the value stored in the address pointed to at r3
	str	r3, [fp, #-8] //Store the value of r3 into the address -8 offset from the fp
	ldr	r3, [fp, #-20] //Load the value at the address -20 offset from fp into r3
	ldr	r2, [r3] //Load the value at the address at r3 into r2
	ldr	r3, [fp, #-16] //Load the value at the address -16 offset from fp into r3
	str	r2, [r3] //Store the value at the address pointed to by r3 into r2
	ldr	r3, [fp, #-20] //Load the value at the address -20 offset from fp into r3
	ldr	r2, [fp, #-8] //Load the value at the address -8 offset from fp into r2
	str	r2, [r3] //Store the value at the address pointed to by r3 into r2
	nop //No operation
	add	sp, fp, #0 //adds frame pointer and 0, and stores value to sp
	@ sp needed
	ldr	fp, [sp], #4 //Loads fp with the value at the address pointed to by sp with offset 4
	bx	lr //Returns function.
	.size	swap, .-swap //Defines size of function.
	.align	2 //The ALIGN directive aligns the current location to a specified boundary by
     //padding with zeros or NOP instructions
	.global	main //Declares the main variable in the assembly listing.
	.syntax unified //Sets the instruction set to be the Unified ARM instruction set.
	.arm //Defined the instruction set being generated: This does the same action as '.code 32'
	.fpu vfp //Defines the floating point unit to assemble for. VFP is designated
	.type	main, %function //Declares the type for main, which is a function.
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr} //Pushes the value of LR into FP
	add	fp, sp, #4 //adds stack pointer by value of 4 and stores into frame pointer.  
	sub	sp, sp, #8 //subtract current stack pointer pointer value by 8 and store value
	mov	r3, #10  // move  value of 10 into r3
	str	r3, [fp, #-8]
	mov	r3, #20	// move value of 20 into r3
	str	r3, [fp, #-12]
	sub	r2, fp, #12 // subtract value of 12 from fp and stores into r2
	sub	r3, fp, #8 // subtract value of 8 from fp and stores into r3
	mov	r1, r2 // move r2 into r1
	mov	r0, r3 // move r3 into r0
	bl	swap
	mov	r3, #0 // moves value of 0 into r3 
	mov	r0, r3
	sub	sp, fp, #4 //subtract value of 4 from frame pointer and store into stack pointer
	@ sp needed
	pop	{fp, pc}
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits

