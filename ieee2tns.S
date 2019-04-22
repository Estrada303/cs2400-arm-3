		;		ARM Programming Assignment #3: IEEE 754 to TNS bit-level marshaller
		;
		;		Write a program to convert a 32-bit single-precision IEEE 754 floating-point
		;		number to the Tandem Non-stop Series (TNS) format. Refer to the README for a
		;		description of the format. Convert the numbers in `floats` and write the TNS
		;		equivalents into the `tns` area, one after the other.
		;
		;		Bonus:
		;		1. (30 extra points) Implement the reverse conversion, from TNS to IEEE.
		;		2. (50 extra points) Organize the code into two subroutines, with stack
		;		support.
		;		3. (10 extra points) In the main program, implement a round-trip conversion
		;		and prove the results match the initial values in 'floats'.  Define a
		;		`FILL` region to hold the IEEE 754 results.
		;
		
		;		Your code here
		
floats	DCD		0xa0bcff0d, 0x13c0adea
tns		FILL		16
MAIN		adr		r1, floats
		ldr		r0, [r1], #4
		bl		convert
		adr		r2, tns
		str		r0, [r2], #4
		ldr		r0, [r1]
		bl		convert
		str		r0, [r2]
		end
		
		
		
		
		
convert
		str		r1, [sp, #-4]!
		str		r2, [sp, #-4]!
		str		r3, [sp, #-4]!
		str		r4, [sp ,#-4]!
		mov		r2, r0
		mov		r1, #1
		lsl		r1, r1, #31
		and		r3, r2, r1  ;unpack sign to r3 ready to repack
		lsl		r4, r2, #1
		lsr		r4, r4, #24 ;unpack	exponent to r4
		lsl		r2, r2, #9
		lsr		r2, r2, #9 ;unpack significandto r2
		sub		r2, r2, #255
		lsl		r2, r2, #9
		lsl		r4, r4, #1
		add		r0, r0, r4
		add		r0, r0, r2
		add		r0, r0, r3
		ldr		r4, [sp], #4
		ldr		r3, [sp], #4
		ldr		r2, [sp], #4
		ldr		r1, [sp], #4
		mov		pc, lr
		
		
		
		
		
		
		
