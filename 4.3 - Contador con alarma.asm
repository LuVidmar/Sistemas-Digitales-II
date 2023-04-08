COUNTER EQU -5
LED EQU P1.0
ORG 0
JMP mainConfig

ORG 0x50
mainConfig:
	;config interruptions
	SETB EA ;enable interruptions
	SETB ET0 ;enable timer0
	MOV TMOD, #00001110b ;set as counter autoreload, with software config
	;start counter from 0 to 5
	MOV TH0, #COUNTER
	MOV TL0, TH0
	SETB TR0 ;start counter
	JMP $

ORG 0x0B
counterInt:
	CPL LED
	RETI
