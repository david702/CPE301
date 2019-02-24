;
; DA1B.asm
;
; Created: 2/23/2019 11:23:09 PM
; Author : David
;


; Replace with your application code

	.org 0
	ldi R21, 0			;R21 initialized
	ldi XL, 0x00		;load 0x0200 into X
	ldi XH, 0x02
	ldi YL, 0x00		;load 0x0400 into Y
	ldi YH, 0x04
	ldi ZL, 0x00		;load 0x0600 into Z
	ldi ZH, 0x06

FILL:
	ldi R20, 0
	add R20, XL	
	add R20, XH			;add x high and low
	st X, R20			;then store into x
	inc XL				;increment
	cpi XL, 255			;check if low of x is under 255
	brsh RESETX			;reset to 0
CONTINUE:
	inc R21				;increment R21
	jmp DIVIDE			;jmp to divide
DIVIDERET:
	cpi R21, 255		;check counter under 255
	brne FILL			;Fills
	ldi R21, 0			;reset R21
FILLMORE:
	ldi R20, 0
	add R20, XL			;add x high and low
	add R20, XH
	st X, R20			;then store into x
	inc XL				;increments
	inc R21				;increment R21
	jmp DIVIDE2			;jmp divide 2
DIVIDERET2:
	cpi R21, 42			;check if 42 is reacehd
	brne FILLMORE		;go to fillmore if condition met
	jmp END				;end 

RESETX:
	ldi XL, 0			;reset 0
	inc XH				;increment 
	jmp CONTINUE

DIVIDE:
	ldi R22, 3			;load 3 in r21 
	ldi R23, 0			;load into R23
	mov R24, R20		;move value r20 into r24
L1:
	inc R23				;increment r23
	sub R20, R22		;subtract r22 and r 20
	BRCC L1				
	dec R23				;decrement r23
	add R20, R22		;add r22 and r20
	cpi R20, 0			;equals zero
	brne NOTDIV			;branch
	st Y, R24			;store r24 into y
	inc YL				;increment 
	ldi R25, 0	
	add R16, R24		;add r24 into r16
	adc R17, R15		;add carry
	jmp DIVIDERET

NOTDIV:
	st Z, R24			;store r24 in z
	inc ZL				
	ldi R25, 0			;initialize
	add R18, R24		;add r24 into r18
	adc R19, R15		;add carry
	jmp DIVIDERET

	DIVIDE2:
	ldi R22, 3			;load 3 into R22
	ldi R23, 0
	mov R24, R20		;copy into R24
L2:
	inc R23				;increment
	sub R20, R22		;subtract 3
	BRCC L2				;branch is greater than 10
	dec R23				;decrement 
	add R20, R22		;add 3 
	cpi R20, 0			;equals 0
	brne NOTDIV2		 
	st Y, R24			;store into Y 
	inc YL				;increment Y 
	ldi R25, 0
	add R16, R24		;add to R16
	adc R17, R25		;add carry
	jmp DIVIDERET2

NOTDIV2:
	st Z, R24			;store Z address
	inc ZL				;increment 
	ldi R25, 0
	add R18, R24		;add to R18
	add R19, R25		;add carry
	jmp DIVIDERET2

END:
	jmp END				;keep jumping forever