;
; Experiment1A.asm
;
; Created: 3/15/2018 12:46:39 PM
; Author : pajard1
;


; Replace with your application code

.org 0
	LDI R16, 32
	SBI DDRB, 5			
	LDI R17, 0
	OUT PORTB, R17		
	LDI R20, 5
	STS TCCR1B, R20		
begin:
	RCALL delay			
	EOR R17, R16		;xor 32 with 0
	OUT PORTB, R17		;output the xored value
	RJMP begin			;jump to begin
delay:
	LDS R29, TCNT1H		
	LDS R28, TCNT1L		;get the low value of the counter
	CPI R28, 0xF3		;compare low value with F3
	BRSH body			
	RJMP delay			;jump to delay
body:
	CPI R29, 0x00		;compare high value to 0
	BRSH done			
	RJMP delay			;jump to delay
done:
	LDI R20, 0x00
	STS TCNT1H, R20		
	LDI R20, 0x00
	STS TCNT1L, R20		
	RET
