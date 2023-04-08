JMP main
main:
	SETB B.0
	MOV A, #11111110b
	MOV P1, A
mainloop:
	CJNE A, #01111111b, notlast
	LCALL toggleB0
	JMP shift
notlast:
	CJNE A, #11111110b, notfirst
	LCALL toggleB0
	JMP shift
notfirst: ;neither first nor last
	JMP shift

shift:
	LCALL delay
	JB B.0, shiftright
	JMP shiftleft
shiftleft:
	RL A
	JMP mainend
shiftright:
	RR A
	JMP mainend
mainend:
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

toggleB0:
	JB B.0, resetbb0
	JMP setbb0
setbb0:
	SETB B.0
	RET
resetbb0:
	CLR B.0
	RET