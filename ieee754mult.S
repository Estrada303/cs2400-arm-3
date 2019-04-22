		;		ARM Programming Assignment #3: 32 bit IEEE 754 single-precision multiplier
		;
		;		Write a 32-bit floating point multiplier. The numbers will be represented
		;		in the single-precision IEEE 754 floating-point standard. The result should
		;		also be in IEEE 754 binary32. Assume you only have normalized numbers, i.e.
		;		the exponent is never 0b00000000.
		;		Write the result in the provided "fill" word.
		
		;		Your code here
		
floats	DCD		0xa0bcff0d, 0x13c0adea
result	FILL		8
main
		
		
		adr		r2, floats
		ldr		r3, [r2], #4 ;load first number
		lsl		r4, r3, #1
		lsl		r5, r4, #8
		lsr		r4, r4, #24 ; R4 exponent for 1st number
		lsr		r5, r5, #9 ; 	R5 fraction for 1st number
		ldr		r6, [r2]
		lsls		r7, r6, #1
		lsl		r8, r7, #8
		lsr		r7, r7, #24 ; R7 exponent for 2nd number
		lsr		r8, r8, #9 ; 	R8 fraction for 2nd number
		add		r7, r7, r4
		mov		r9, #0
		mov		r10, #0
		mov		r11, #0
loop		tst		r8, #1 ; multiply significands
		addsne	r9, r9, r5
		tst		r8, #1
		adcne	r10, r10, r11
		lsls		r5, r5, #1
		lsl		r11, r11, #1
		adc		r11, r11, #0
		lsrs		r8, r8, #1
		bne		loop
		lsl		r7, r7, #23
		; r7 has result for exponent
		; r9, r10 have product of signficands
		;I am lost from here I am not sure how to round the number to put into 22 digit space
		
		
		
		
		
		
