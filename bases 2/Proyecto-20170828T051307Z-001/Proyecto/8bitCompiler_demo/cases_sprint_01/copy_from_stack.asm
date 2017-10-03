; Pushes values k, k-1, ..., 1 into stack.Hence stack =[1,2,..., k]
; Then copies k elements from stack into cells start_data, start_data+1, ..., end_data-1, without pop them
   JMP start
start_data:
x_0: DB 0
x_1: DB 0
x_2: DB 0
end_data:
;
start:
    MOV B, end_data
	MOV A, start_data
	SUB B, A ; B = k
	MOV A, 0
push_k:
	CMP B, 0
	JE copy
	PUSH B
	DEC B
	INC A
	JMP push_k
copy:
    MOV B, A
	MOV C, end_data
    DEC C
	MOV D, SP
    ADD D, B
loop:
	CMP B, 0
	JE end_copy
	MOV A, [D]
	DEC D
	MOV [C], A
	DEC B
	DEC C
	JMP loop
end_copy:
	HLT
