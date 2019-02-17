;
; DA1A.asm
;
; Created: 2/11/2019 7:09:25 PM
; Author : David
;


; Replace with your application code
.org 0x0000

start: 
LDI R25, 0x20 ; Store 32 in high register
LDI R24, 0x18 ; Store 24 in low register
LDI R22, 0x15 ; Store 21 in low register
LDI R26, 0 ; Store 0 in register
MOV R17, R22 ; move value of register 22 in 17
INC R17 ; Increment register
LDI R18, 0 ; Store 0 in register 
LDI R19, 0 ;	||
LDI R20, 0 ;	||
CPI R22, 0 ;Checks in register is 0, then input into final registers

BREQ done ;Stops until register 22 is 0
multiply:
DEC R17 ;decrement register
BREQ DONE ;jump done if the value is 0
ADD R18, R24 ;adds register 24 into 18 Low
ADC R19, R25 ;adds register 25 into 19 High
ADC R20, R26 ;add carry to register 20
JMP multiply ;jmp to multiply until condition met

done: