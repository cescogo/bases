package eightBit.ASM;
import java.util.*;
import java.io.*;
public class ASMBlock implements ASMAst {
   protected List<ASMAst> members;
   public List<ASMAst> getMembers(){
	   return this.members;
   }
   public ASMBlock(List<ASMAst> members){
      this.members = members;
   }
   public void genCode(PrintStream out){
       this.members.stream().filter(t -> t != null)
	                        .forEach( t -> t.genCode(out));
   }
   
}