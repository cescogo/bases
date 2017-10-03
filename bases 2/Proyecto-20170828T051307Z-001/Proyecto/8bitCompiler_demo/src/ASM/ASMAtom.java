package eightBit.ASM;
import java.io.*;
public class ASMAtom<T> implements ASMAst{
   private T value;
   public T getValue(){return this.value;}
   
   public ASMAtom(T value){
      this.value = value;
   }
   public void genCode(PrintStream out){
      out.print(this.value);
   }
}