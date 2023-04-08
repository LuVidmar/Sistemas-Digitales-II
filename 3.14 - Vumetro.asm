ORG 50
tabla1:
DB 11111111b, 11111110b, 11111100b, 11111000b, 11110000b, 11100000b, 10000000b, 00000000b
ORG 0
JMP main

main:
	
mainLoop:
	CALL readADC
	MOV B, P2
	CALL transformLevel
	JMP mainLoop


readADC:
	CLR P3.7
	CLR P3.6
	SETB P3.6
	SETB P3.2
waitReading:
	JB P3.2, waitReading ;si esta en 1 sigue leyendo
	RET	;volver con el valor en p2

transformLevel:
	MOV A, #-1
	MOV R0, #-1
	SETB C
nextLed:
	JNC foundLeds
	INC R0
	ADD A, #28
	CJNE A, B, nextLed
foundLeds:
	LCALL setNumber
	RET

setNumber:
	MOV A, R0
	MOV DPTR, #tabla1
	MOVC A, @A+DPTR 
	MOV P1, A
	RET