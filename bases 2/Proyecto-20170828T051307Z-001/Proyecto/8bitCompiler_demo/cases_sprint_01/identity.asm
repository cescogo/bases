; %%%%%%%%%%%%  8bits compilation by hand %%%%%%%%%%%%%
;
; loriacarlos@gmail.com EIF400
;
; NOTICE
; It is not an optimized code
;
; Demo test case
;
; fun f(n){
;     if ( n == 0) 
;        return n;
;     else return f( n - 1) + 1
;}
;
; fun main(){
;     f(1);
;}
;
.init:
    MOV D, 232     ; D always points to console
	JMP main       ; go to main
; %%%%%%%%%%% GLOBAL DATA AREA %%%%%%%%%%
; f data area
.f_data:
f_ra: DB 0 ; f return address
f_n:  DB 0 ; f formal parameter n
;
; main data area
.main_data:
.main_n: 4
;
; %%%%%%%%%%% GLOBAL CODE AREA %%%%%%%%%%%
; fun f(n)
f:
.f_prolog:
	POP C           ; C = ra (new return adddress)
	POP A           ; A = n  (new n value)
	PUSH [f_n]      ; saves old n in stack
	PUSH [f_ra]     ; saves old ra in stack
	MOV  [f_ra], C  ; stores new ra
	MOV  [f_n], A   ; stores new n
;
; Properly generated source code of f starts here
;{ start of f
; if (n == 0) return n;
;
	PUSH [f_n]
	PUSH 0
	POP B
	POP A
	CMP A, B
	JNE .f_else_01
	PUSH [f_n]
	JMP .f_return
;
; else return f(n-1)+1
; 
.f_else_01:
	PUSH [f_n]
	PUSH 1
	POP B
	POP A
	SUB A, B
	PUSH A
;   n - 1
	CALL f
;   f( n - 1) on top
	PUSH 1
	POP B
	POP A
	ADD A, B
	PUSH A
;   f ( n - 1) + 1
;   return 
	JMP .f_return
;
.f_return:        ; Every return will end here. 
	POP A         ; Assumes return value on stack's top.
	MOV C, [f_ra] ; gets ra into C
	POP B         ; restores previous ra
	MOV [f_ra], B
	POP B         ; restores previous n
	MOV [f_n], B
	PUSH A        ; pushes return value
	PUSH C        ; pushes return address
	RET
;} end of f
;
main:
;   f(1)
;   Pushes the value in stack and calls f
	PUSH 1
	CALL f
;   When f returns the returned value on top
;   The rest from here is just for demo purposes (it should be print_number)
	POP B
	ADD B, 48
	MOV [D], B
	HLT
	
	
	
	