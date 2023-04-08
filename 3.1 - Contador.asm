JMP main
main:
	PUSH ACC
	MOV A, #0x10
	MOV 0x30, ACC
	INC A
	INC A
	INC A
	INC A
	INC A
	MOV 0x31, ACC
pe:
	JMP pe
	