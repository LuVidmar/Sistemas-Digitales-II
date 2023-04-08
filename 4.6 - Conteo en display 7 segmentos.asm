SPEED EQU -100
CANT EQU 10

ORG 0x200
numbers:
DB 11000000b, 11111001b, 10100100b, 10110000b, 10011001b, 10010010b, 10000010b, 11111000b, 10000000b, 10011000b

ORG 0
JMP main

ORG 0x300
main:
	;enable interruptions
	SETB EA
	SETB ET0
	;config int
	MOV TMOD, #00000010b ;timer autoreload
	MOV TH0, #SPEED
	MOV TL0, TH0
	;config pointers
	MOV DPTR, #numbers
	MOV B, #0
	;start timer
	SETB TR0
display:
	CALL numberToDisplay
	;first display
	MOV A, #00011000b ;set bits 3 and 4
	ORL A, P3
	MOV P3, A
	;second display
	CLR P3.3
	;third display
	MOV R1, #00011000b
	ORL A, R1
	MOV R1, #11101111b
	ANL A, R1
	MOV P3, A
	;fourth display
	CLR P3.3
	JMP display

nextNum:
	PUSH ACC
	MOV A, B
	CJNE A, #CANT, dontReset
	MOV B, #0
dontReset:
	INC B
	POP ACC
	RET

numberToDisplay: ;recieves number in B
	PUSH ACC
	MOV A, B
	MOVC A, @A+DPTR
	MOV P1, A
	POP ACC
	RET

ORG 0x0B
	CALL nextNum
	RETI
