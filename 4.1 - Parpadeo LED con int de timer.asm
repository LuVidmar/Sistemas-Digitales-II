ORG 0
JMP config

ORG 0x50
config:
	;setting IE register
	SETB EA ; enable all
	SETB ET0 ; enable timer 0, same as IE.1
	;setting mode
	MOV TMOD, #00000010b
	;starting
	MOV TL0, #100 ;count until
	MOV TH0, #100 ;count until
	SETB TR0 ;start timer
	jmp $

ORG 0X0B
interruptT0:
	CPL P1.0
	RETI
