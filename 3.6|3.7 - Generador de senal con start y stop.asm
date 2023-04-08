JMP main
main:
	CLR P0.7
	MOV A, #0
loop:
	LCALL contadorA
	LCALL contadorB
	JMP loop

contadorA:
	INC A
	MOV P1, A
	PUSH ACC
	MOV A, P2
	CJNE A, #01111111b, continueA
	LCALL pause
continueA:
	POP ACC
	CJNE A, #0x15, contadorA
	RET

contadorB:
	DEC A
	MOV P1, A
	PUSH ACC
	MOV A, P2
	CJNE A, #01111111b, continueB
	LCALL pause
continueB:
	POP ACC
	CJNE A, #0, contadorB
	RET

pause:
	MOV A, P2
	CJNE A, #11111111b, pause
	RET
