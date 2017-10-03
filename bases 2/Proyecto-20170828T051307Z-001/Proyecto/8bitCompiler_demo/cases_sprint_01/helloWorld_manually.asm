;
;fun main(){
;	print_string('Hello World!");
;	
;}
.init:
     MOV D, 232
     JMP main
; Data Area
.main_data:
.UNDEF: DB 255
.main_string_01: DB "Hello World!"
	 DB 0
; Code Area
print_string:
     POP C
     POP B
     PUSH C 
.print_string_loop_01:
     MOV C, [B]
	 CMP C, 0
	 JE .print_string_exit
	 MOV [D], C
	 INC D
	 INC B
	 JMP .print_string_loop_01
.print_string_exit:
     POP C 
     PUSH .UNDEF
     PUSH C
     RET
main: 
     PUSH .main_string_01
	 CALL print_string
	 POP A
	 HLT