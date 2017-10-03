package eightBit.ASM;
import java.util.*;
import java.io.*;
public class ASMProgram implements ASMAst{
   static private ASMId UNK = new ASMId("");
   private ASMId name;
   private List<ASMAst> functions;
   private ASMAst body;
   public ASMProgram(List<ASMAst> functions){
      this(UNK, functions);
   }
   public ASMProgram(ASMId name, List<ASMAst> functions){
      this.functions = functions;
	  this.name = name;
   }
   public void genCode(PrintStream out){
       functions.stream().forEach( t -> t.genCode(out));
   }
}