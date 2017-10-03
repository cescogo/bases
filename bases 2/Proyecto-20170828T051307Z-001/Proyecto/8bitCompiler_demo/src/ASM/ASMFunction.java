package eightBit.ASM;

import java.util.*;
import java.io.*;

public class ASMFunction implements ASMAst{
   static private ASMId UNK = new ASMId("");
   private ASMId name;
   private List<ASMAst> formals;
   private ASMAst body;
   public ASMFunction(List<ASMAst> formals, ASMAst body){
      this(UNK, formals, body);
   }
   public ASMFunction(ASMId name, List<ASMAst> formals, ASMAst body){
      this.formals = formals;
	  this.body = body;
	  this.name = name;
   }
   public void genCode(PrintStream out){
       out.format(this.name.getValue()+": \n\t"); //Imprime nombre de la funcion
	   if (this.formals != null)
	      this.formals
	          .stream()
	          .filter(f -> f != null)
	          .forEach(f -> f.genCode(out));  //Imprime argumentos
	   if (this.body != null){
		    this.body.genCode(out);
	   }			 //Imprime el cuerpo de la funcion
	     
   out.print("\n");
   }
}