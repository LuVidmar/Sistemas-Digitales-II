FREQ EQU -5

ORG 0
JMP main

ORG 0x300
main:
	;start DAC
	CLR P0.7
	;start ADC
	CLR P3.7
	;enable interruptions
	SETB EA
	SETB ET0
	;configure interruptions
	MOV TMOD, #00000010b
	MOV TH0, #FREQ
	MOV TL0, TH0
	;start timer
	SETB TR0
	;read ADC all the time
readADC:
	CLR P3.6
	SETB P3.6
processing:
	JB P3.2, $
	MOV B, P2
	JMP readADC

moveBtoDAC:
	MOV P1, B
	RET

ORG 0x0B
	CALL moveBtoDAC
	RETI
	