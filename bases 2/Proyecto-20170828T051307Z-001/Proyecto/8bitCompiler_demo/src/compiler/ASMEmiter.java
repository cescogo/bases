package eightBit.compile;

import eightBit.ASM.*;
import java.util.*;

public interface ASMEmiter{
	Hashtable<Integer, String> tableSimbol = new Hashtable<Integer, String>();
	
   default ASMAst PROGRAM(List<ASMAst> functions){ return new ASMProgram(functions);} 
   
   default ASMAst BLOCK(List<ASMAst> members){ return new ASMBlock(members);}
   default ASMAst BLOCK(){ return new ASMBlock(Arrays.asList());}
   
   default ASMAst EMPTY(){
	   return new ASMEmpty();
   }
   
   default ASMNum NUM(double value){ return new ASMNum(value);}
   
   default ASMId  ID(String value){return new ASMId(value);}
   
   default ASMFunction FUNCTION(ASMId id, List<ASMAst> formals, ASMAst body){
           return new ASMFunction(id, formals, body);
   }
   
   
   default ASMIf IF(ASMAst c, ASMAst t, ASMAst e){
       return new ASMIf(c, e, t);
   }
   
   default ASMCall CALL(ASMAst f, List<ASMAst> args){
       return new ASMCall(f, args);
   }
   default ASMAst OPERATION(ASMAst oper, ASMAst left, ASMAst right){
	   return new ASMOperation(oper, left, right);
   }
   default ASMAst FOLD_LEFT(ASMAst left, ASMAst right){
	   // Expected right = OPERATION(oper, null, r)
	   ASMOperation rightOperation = (ASMOperation)right;
	   // Returns OPERATION(oper, left, r)
	   return new ASMOperation(rightOperation.getOper(), left, rightOperation.getRight());
   }
   default ASMAst ASSIGN(ASMAst left, ASMAst right){
	   return new ASMAssign(left, right);
   }
   default List<ASMAst> ARGS(List<ASMAst>  args){ return args;}
   //default List<ASMAst> ARGS(ASMAst... args){ return Arrays.asList(args);}
   default List<ASMAst> FORMALS(ASMAst... args){ return Arrays.asList(args);}
   
   
   default ASMAst RET(ASMAst e){ return new ASMReturn(e);}
   default ASMAst OPER(String op){return new ASMId(op);}
   final ASMBool TRUE = new ASMBool(true);
   final ASMBool FALSE = new ASMBool(false);
   final ASMAst ADD = new ASMId("\n\tADD A, B ");
   final ASMAst MINUS = new ASMId("\n\tSUB A, B ");
   final ASMAst MUL = new ASMId("\n\tMUL A ");
   final ASMAst DIV = new ASMId("\n\tDIV A ");
   final ASMAst NULL = new ASMId("null");
  // final ASMAst RET = new ASMReturn(DIV);
   
   
   
}