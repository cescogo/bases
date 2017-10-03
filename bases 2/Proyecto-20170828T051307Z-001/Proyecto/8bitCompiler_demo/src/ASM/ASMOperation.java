package eightBit.ASM;
import java.io.*;
public class ASMOperation implements  ASMAst{
   private ASMAst oper;
   private ASMAst left, right;
   public ASMAst getOper(){return this.oper;}
   public ASMAst getLeft(){return this.left;}
   public ASMAst getRight(){return this.right;}
   public ASMOperation(ASMAst oper, ASMAst left, ASMAst right){
      this.oper = oper;
	  this.left = left;
	  this.right = right;
   }
 
	final ASMAst push = new ASMId("\n\tpush ");
    final ASMAst pop = new ASMId("\n\tpop ");
	final ASMAst Areg = new ASMId(" A ");
	final ASMAst Breg = new ASMId(" B ");
	final ASMAst abre = new ASMId("[");
	final ASMAst cierra = new ASMId("]");
	
	
   public void genCode(PrintStream out){
	if(left != null && right != null){
		push.genCode(out);left.genCode(out);
		push.genCode(out);right.genCode(out);
		pop.genCode(out);Areg.genCode(out); 
		pop.genCode(out);Breg.genCode(out);
		oper.genCode(out);
		push.genCode(out);Areg.genCode(out);
	}
		//left.genCode(out);out.print(",");right.genCode(out); /////////cambio in a pre
		//push.genCode(out); Areg.genCode(out);
		
 }
}