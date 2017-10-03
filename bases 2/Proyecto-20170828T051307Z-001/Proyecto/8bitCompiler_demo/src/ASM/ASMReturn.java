package eightBit.ASM;
import java.util.*;
import java.io.*;
public class ASMReturn implements ASMAst{

   private ASMAst e;
   public ASMReturn(ASMAst e){
      this.e = e;
   }
   public void genCode(PrintStream out){
      this.e.genCode();
	  out.print("\n\tRET\n");
	  out.print(";");
   }
}