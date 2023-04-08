JMP main
main:
	MOV A, #0x10
	MOV 0x30, A
loop:
	INC A
	MOV 0x31, A
	CJNE A, #0x15, loop
ep:
	JMP ep