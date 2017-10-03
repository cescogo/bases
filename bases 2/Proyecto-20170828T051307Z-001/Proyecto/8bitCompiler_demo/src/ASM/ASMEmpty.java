package eightBit.ASM;
import java.util.*;
import java.io.*;
	
public class ASMEmpty implements ASMAst{
   @Override
   public void genCode(PrintStream out){
	   out.println("/* empty statement! */");
   }
}