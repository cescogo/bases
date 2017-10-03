package eightBit.ASM;
import java.io.*;
public class ASMAssign extends  ASMOperation{
   final public static ASMId EQ = new ASMId("");
   public ASMAssign(ASMAst left, ASMAst right){
      super(EQ, left, right);
   }
   public void genCode(PrintStream out){
      super.genCode(out);
   }
}