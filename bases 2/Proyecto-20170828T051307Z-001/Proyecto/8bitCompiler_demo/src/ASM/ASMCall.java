package eightBit.ASM;
import java.util.*;
public class ASMCall implements ASMAst{
   
   private ASMAst f;
   private List<ASMAst> args;
   
   public ASMCall(ASMAst f, ASMAst e){
      this(f, Arrays.asList(e));
   }
   public ASMCall(ASMAst f, List<ASMAst> args){
      this.f = f;
      this.args = args;
	  
   }
}