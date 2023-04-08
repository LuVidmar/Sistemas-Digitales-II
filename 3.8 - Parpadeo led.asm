JMP main
main:
	CLR P1.0
	LCALL delay10
	SETB P1.0
	LCALL delay10
	JMP main

delay10:
	PUSH ACC
	MOV A, #0
loop:
	INC A
	CJNE A, #10, loop
	POP ACC
	RET