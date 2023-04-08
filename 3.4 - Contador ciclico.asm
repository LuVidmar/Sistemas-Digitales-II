JMP main
main:
	MOV A, #0x10
	LCALL contadorA
	JMP main

contadorA:
	INC A
	CJNE A, #0x14, contadorA
	RET