package eightBit.ASM;
import java.io.*;

public interface ASMAst{
   default void genCode(){
      genCode(System.out);
   }
   default void genCode(PrintStream out){
   }
}