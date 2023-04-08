CERO EQU 11000000b
UNO EQU 11111001b
DOS EQU 10100100b
TRES EQU 10110000b
CUATRO EQU 10011001b
CINCO EQU 10010010b
SEIS EQU 10000010b
SIETE EQU 11111000b
OCHO EQU 10000000b
NUEVE EQU 10011000b
LETRAA EQU 10100000b
LETRAB EQU 10000011b
LETRAC EQU 11000110b
LETRAD EQU 10100001b
LETRAE EQU 10000100b
LETRAF EQU 10001110b

JMP main
main:
	MOV A, #0
main_loop:
	LCALL delay
	PUSH ACC
	LCALL loadLetterInB
	POP ACC
	MOV P1, B
	INC A
	CJNE A, #0x10, main_loop
	JMP main

delay:
	PUSH ACC
	MOV A, #0
loop_delay:
	INC A
	CJNE A, #5, loop_delay
	POP ACC
	RET

loadLetterInB: ;recieves number to laod in a, returns bcd in b
	INC A
	DJNZ ACC, notCero
	MOV B, #CERO
	RET
notCero:
	DJNZ ACC, notOne
	MOV B, #UNO
	RET
notOne:
	DJNZ ACC, notTwo
	MOV B, #DOS
	RET
notTwo:
	DJNZ ACC, notThree
	MOV B, #TRES
	RET
notThree:
	DJNZ ACC, notFour
	MOV B, #CUATRO
	RET
notFour:
	DJNZ ACC, notFive
	MOV B, #CINCO
	RET
notFive:
	DJNZ ACC, notSix
	MOV B, #SEIS
	RET
notSix:
	DJNZ ACC, notSeven
	MOV B, #SIETE
	RET
notSeven:
	DJNZ ACC, notEight
	MOV B, #OCHO
	RET
notEight:
	DJNZ ACC, notNine
	MOV B, #NUEVE
	RET
notNine:
	DJNZ ACC, notA
	MOV B, #LETRAA
	RET
notA:
	DJNZ ACC, notB
	MOV B, #LETRAB
	RET
notB:
	DJNZ ACC, notC
	MOV B, #LETRAC
	RET
notC:
	DJNZ ACC, notD
	MOV B, #LETRAD
	RET
notD:
	DJNZ ACC, notE
	MOV B, #LETRAE
	RET
notE:
	MOV B, #LETRAF
	RET