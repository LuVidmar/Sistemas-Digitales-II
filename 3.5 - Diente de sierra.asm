JMP main
main:
	CLR P0.7
loop:
	MOV A, #0
	LCALL contadorA
	JMP loop

contadorA:
	INC A
	MOV P1, A
	CJNE A, #0x15, contadorA
	RET