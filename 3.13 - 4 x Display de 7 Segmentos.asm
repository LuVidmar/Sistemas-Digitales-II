CERO EQU 11000000b
UNO EQU 11111001b
DOS EQU 10100100b
TRES EQU 10110000b
CUATRO EQU 10011001b

JMP main
	MOV P1, #0xFF
main:
	MOV A, #3
	LCALL selectDisplay
	MOV P1, #UNO
	MOV P1, #0xFF
	MOV A, #2
	LCALL selectDisplay
	MOV P1, #DOS
	MOV P1, #0xFF
	MOV A, #1
	LCALL selectDisplay
	MOV P1, #TRES
	MOV P1, #0xFF
	MOV A, #0
	LCALL selectDisplay
	MOV P1, #CUATRO
	MOV P1, #0xFF
	JMP main

selectDisplay: ;recieves display number in a
	PUSH ACC
	INC A
	DJNZ ACC, notCero
	CLR P3.3
	CLR P3.4
	JMP enddisplsel
notCero:
	DJNZ ACC, notUno
	SETB P3.3
	CLR P3.4
	JMP enddisplsel
notUno:
	DJNZ ACC, notDos
	CLR P3.3
	SETB P3.4
	JMP enddisplsel
notDos:
	SETB P3.3
	SETB P3.4
	JMP enddisplsel
enddisplsel:
	POP ACC
	RET
