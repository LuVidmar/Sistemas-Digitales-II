LED EQU P1.0

ORG 0
JMP configInt

ORG 0x50
configInt:
	SETB EA ;enable global interruptions
	SETB EX0 ;enable external interruption 0
	SETB EX1 ;enable external interrutpion
	SETB IT0 ;needed for ext int
	SETB IT1
waitForInt:
	JMP $

ORG 0x03
extInt:
	SETB LED
	RETI

org 0x13
extInt1:
	CLR LED
	RETI