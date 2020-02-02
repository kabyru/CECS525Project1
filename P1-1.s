	.arch armv6 //Specifies the architecture used for this assembly file. ArmV6.
	.eabi_attribute 28, 1 //eabi_attributes declare arcane options present in the CPU.
	.eabi_attribute 20, 1 //...do not change when altering the functionality of the program
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"P1-1.c" //Declares the source file of this assembly listing.
	.text //Declares that this section contains the source code.
	.global	var1 //Declaration of the first variable var1.
	.data //Declares that the following code contains the code related to variables and data. Seperate from source code.
	.type	var1, %object //Declares the type of var1, which is an object (since it is a variable)
	.size	var1, 1 //Allots 1 block of memory for var1
var1:
	.byte	1 //Declares the datatype of var1 to be a BYTE.
	.global	var2 //Declares the var2 variable in the assembly listing.
	.type	var2, %object //Declares the type of var2, which is an object (since it is a variable)
	.size	var2, 1 //Allots 1 block of memory for var2
var2:
	.byte	2 //Declares the datatype of var1 to be a BYTE.
	.global	var3 //Declares the var2 variable in the assembly listing.
	.align	2 //The ALIGN directive aligns the current location to a specified boundary by padding with zeros or NOP instructions
	.type	var3, %object //Declares the type of var3, which is an object (since it is a variable)
	.size	var3, 4 //Allots 4 blocks of memory for var3
var3:
	.word	3 //Declares the datatype of var3 to be a WORD.
	.global	var4 //Declares the var4 variable in the assembly listing.
	.align	2 //The ALIGN directive aligns the current location to a specified boundary by padding with zeros or NOP instructions
	.type	var4, %object //Declares the type of var4, which is an object (since it is a variable)
	.size	var4, 4 //Allots 4 blocks of memory for var4
var4:
	.word	4 //Declares the datatype of var4 to be a WORD.
	.global	num //Declares the num variable in the assembly listing.
	.section	.rodata //Begins a section of READ-ONLY data
	.align	2 //The ALIGN directive aligns the current location to a specified boundary by padding with zeros or NOP instructions
	.type	num, %object //Declares the type of num, which is an object (since it is a variable)
	.size	num, 4 //Allots 4 blocks of memory for num
num:
	.word	-10 //Declares the datatype of num to be a WORD, gives a value thats provided in the C file 
	.global	wave //Declares the wave variable in the assembly listing.
	.data
	.align	2 //The ALIGN directive aligns the current location to a specified boundary by padding with zeros or NOP instructions
	.type	wave, %object //Declares the type of wave, which is an object (since it is a variable)
	.size	wave, 10 //Allots 10 blocks of memory for wave
wave:
	.ascii	"goodbye!!!" //Declares the datatype of wave to be ASCII
	.text
	.align	2 //The ALIGN directive aligns the current location to a specified boundary by padding with zeros or NOP instructions
	.global	main //Declares the main variable in the assembly listing.
	.arch armv6 //Declares the architecture compiled on, (ARMv6 RPi)
	.syntax unified //Sets the instruction set to be the Unified ARM instruction set.
	.arm //Defined the instruction set being generated: This does the same action as '.code 32'
	.fpu vfp //Defines the floating point unit to assemble for. VFP is designated
	.type	main, %function //Declares the type for main, which is a function.
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]! //Store value of fp (frame pointer) into an address equal to the sum
			        //of sp (stack pointer) and -4.
	add	fp, sp, #0 //Adds sp (stack pointer) and 0, stores result in fp (frame pointer).
	sub	sp, sp, #12 //Subtracts current stack pointer value by 12 and stores value.
	mov	r3, #5 //Copies a value of 5 into r3.
	str	r3, [fp, #-8] //Stores the value of r3 (5) into a register in an address equal to
			      //the sum of the frame pointer and -8.
	b	.L2	     //Code jumps to L2 to continue operation
.L3:
	ldr	r3, .L9 //Loads the first value in L9 into r3
	ldrsb	r3, [r3] //Loads signed byte var1 (var1 is of signed char)
	uxtb	r2, r3 //Extends 8-bit value of r3 into a 32-bit value, stored in r2
	ldr	r3, .L9 //Loads the first value of L9 into r3
	ldrsb	r3, [r3] //Loads signed byte (var1 is of signed char)
	uxtb	r3, r3 //Extends 8-bit value of r3 into a 32-bit value, stored in r3
	smulbb	 r3, r2, r3 //Multiplies two bytes and stores the result into r3
	uxtb	r3, r3 //Extends r3, now holding the result, into 32-bit value
	sxtb	r2, r3 //Sign extends r3 and stores the result into r2
	ldr	r3, .L9 //Loads the first value at L9 and stores it into r3.
	strb	r2, [r3] //Stores the value at the address pointed by r3 into r2.
	ldr	r3, .L9 //Loads the first value at L9 and stores it into r3.
	mov	r2, #1 //Copies a value of 1 into r2.
	strb	r2, [r3] //Stores the value at the address pointed by r3 into r2.
	ldr	r3, .L9 //Loads the first value at L9 and stores it into r3.
	ldrsb	r3, [r3] //Loads signed byte pointed to by r3 into r3
	uxtb	r3, r3 //Extends length of r3 to 32 bits
	lsl	r3, r3, #1 //Shifts the value at register three to the left by 1. Acts as multiplying
			   //the register by a power of two.
	uxtb	r3, r3 //Extends r3, now holding the result, into 32-bit value
	sxtb	r2, r3 //Sign extends r3 and stores the result into r2
	ldr	r3, .L9 //Loads the first value at L9 and stores it into r3.
	strb	r2, [r3] //Stores the value at the address pointed by r3 into r2.
	ldr	r3, .L9 //Loads the first value at L9 and stores it into r3.
	mov	r2, #0 //Copies a value of 0 into r2.
	strb	r2, [r3] //Stores the value at the address pointed by r3 into r2.
	ldr	r3, [fp, #-8] //Loads the value of r3 into an address with value of frame pointer
			      //minus 8
	sub	r3, r3, #1 //Subtracts the value of r3 by 1.
	str	r3, [fp, #-8] //Stores the value of r3 into an address with value of frame pointer
			      //minus 8.
.L2:
	ldr	r3, [fp, #-8] //Using [] signifies a pointer. Loads the value stored in the address
			      //fp - 8 (local int value) into r3.
	cmp	r3, #0 //Compares the value of r3 to 0.
	bgt	.L3 //Jump code to .L3 if value in r3 is greater than 0
.L4:
	ldr	r3, .L9+4 //Load the second value of program
	ldr	r3, [r3] //Stores the value at the address pointed by r3 into r2.
	sub	r3, r3, #1 //Subtracts the value of r3 by 1.
	ldr	r2, .L9+4 //Load the second value of r3
	str	r3, [r2] //Loads r3 with the value at the address pointed by r2.
	ldr	r3, .L9+4 //Load the second value of program
	ldr	r3, [r3] //Loads r3 with the value at the address pointed by r3.
	cmp	r3, #0 //Compare if the value stored in r3 is equal to zero.
	bne	.L4 //Continue loop to L4 if less than 0
	b	.L8 //Branch to L8 if value is greater than or equal to 0.
.L7:
	ldr	r3, .L9+8 //Loads r3 with the value of var2
	ldrb	r2, [r3]	@ zero_extendqisi2 //Load register byte, loads the value at the address of r3
	ldr	r3, .L9+8 //Loads r3 with the value of var2
	strb	r2, [r3] //Store register byte, stores the value r3 into r2 (var2=var2)
	b	.L6 //Branch to L6 when complete
.L8:
	ldr	r3, .L9+12 //Loads r3 with the address of var3
	ldr	r3, [r3] //Loads r3 with the value at the address pointed to be r3
	cmp	r3, #3 //Compare r3 to 3 - (while(var3 == 3))
	beq	.L7 //Branch to L7 if r3 (word3) does equal 3. Enters while loop
.L6:
	nop //No operation
	add	sp, fp, #0 //Sets the stack pointer equal to the frame pointer
	@ sp needed
	ldr	fp, [sp], #4 //Loads the frame pointer value with the value of the stack pointer with 
        an offset of 4.
	bx	lr  //Returns the program. Program complete.
.L10:
	.align	2 //Aligned to a 2-byte boundary
.L9:
	.word	var1 //Declares first variable var1 (in order of use)
	.word	var4 //Declares second variable var4
	.word	var2 //Declares third variable var2
	.word	var3 //Declares fourth variable var3
	.size	main, .-main //Reserves size in memory for program
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0" //Identifies version of compiler used.
	.section	.note.GNU-stack,"",%progbits //Used by compiler.

