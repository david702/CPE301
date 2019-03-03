;
; Experiment2A.asm
;
; Created: 3/15/2018 12:49:33 PM
; Author : pajard1
;


; Replace with your application code
.ORG 0x00
MAIN:
	LDI R16, 32
	SBI DDRB, 5			
	LDI R17, 0
	LDI R18, 0
	OUT DDRD, R18			;set DDRD to input
	LDI R20, 13
	STS TCCR1B, R20			
	IN R20, PIND			;get input values
	ANDI R20, 0b00000010	;bitmask input value
	CPI R20, 0b00000010		
	BRNE MAIN
begin:
	RCALL delay				;call delay function
	EOR R17, R16			;xor 32 with 0
	OUT PORTB, R17			;output to PORTB 5
	RJMP begin
delay:
	LDS R29, TCNT1H			
	LDS R28, TCNT1L			;get lower half of counter
	CPI R28, 0xF3			;check if TCNT1L is 0xF3
	BRSH body				
	RJMP delay				;jump to delay
body:
	CPI R29, 0x00			
	BRSH done				;branch if same or higher
	RJMP delay				;jump to delay
done:
	LDI R20, 0x00
	STS TCNT1H, R20			;reset TCNT1H to 0
	LDI R20, 0x00
	STS TCNT1L, R20			;reset TCNT1L to 0
	RET
