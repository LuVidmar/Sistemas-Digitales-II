JMP main
main:
	MOV A, #11111110b
	MOV P1, A
mainloop:
	LCALL delay
	RL A
	MOV P1, A
	JMP mainloop

delay:
	PUSH ACC
	MOV A, #0
delayloop:
	INC A
	CJNE A, #10, delayloop
	POP ACC
	RET