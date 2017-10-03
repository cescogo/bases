package eightBit.ASM;
import java.util.*;
import java.io.PrintStream;

public class ASMIf implements ASMAst{
  
   private ASMAst c, t, e;
   public ASMIf(ASMAst c, ASMAst t, ASMAst e){
      this.c = c;
	  this.t = t;
	  this.e = e;
   }
   @Override
   public void genCode(PrintStream out){
     out.format("if("); 
	 this.c.genCode(out); 
	 out.format(")"); 
	 this.t.genCode(out); 
	 out.format("else "); 
	 this.e.genCode(out);
	 out.format(";"); 
   }
}