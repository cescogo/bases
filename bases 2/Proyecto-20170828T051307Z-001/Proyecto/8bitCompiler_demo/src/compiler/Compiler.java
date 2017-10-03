/*
 loriacarlos@gmail.com EIF400 II-2016
 EightBit starting compiler
*/
package eightBit.compile;


import eightBit.ASM.*;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.util.*;
import java.util.stream.*;


public class Compiler extends EightBitBaseVisitor<ASMAst> implements ASMEmiter{
	public static int contador = 0;
   protected ASMAst program;
   public ASMAst getProgram(){
	   System.out.println("JMP start \nstart:\n\tMOV D, 232\n");
	   return this.program;
   }
   protected List<ASMAst> statements = new ArrayList<>();
   
   public void genCode(){
      this.statements.stream()
	                 .forEach( t -> t.genCode());
   }
   public ASMAst compile(ParseTree tree){
	   System.out.println("JMP start \nstart:\n\tMOV D, 232\n");
      return visit(tree);
   }
   @Override
   public ASMAst visitEightProgram(EightBitParser.EightProgramContext ctx){
	   ctx.eightFunction().stream()
	                      .forEach( fun -> visit(fun) );
	   return this.program = PROGRAM(this.statements);
   }
   @Override
   public ASMAst visitEightFunction(EightBitParser.EightFunctionContext ctx){
	   String word = "";
	   int m=0;
	   contador++;
      ASMId id = (ASMId)visit(ctx.id());
	  //System.out.println(ctx.id().getText());->Saca el nombre de la funcion
	  tableSimbol.put(contador, ctx.id().getText());//Guarda en el Hash el nombre de la funcion
	  ASMAst f = visit(ctx.formals());
	  //System.out.println(ctx.formals().getText());->Saca parametros
		String paraString = ctx.formals().getText();
		String[] parts = new String[30]; 
		parts = paraString.split(",");
		while(parts[m] != null){
			System.err.println(parts[m]);	
			//tableSimbol.put(parts[j]); 
			m++;
		}
		/*for(int j=0;j<paraString.length()-1;j++){
			System.err.println("dentro del for");
			System.err.println(paraString);
			if(paraString.substring(m,1) == ","){
				System.err.println("dentro del if");
				contador++;
				tableSimbol.put(contador,word);
				word = "";
			}else{
				System.err.println("dentro del else");
				word = word+paraString.substring(m,1);
				System.err.println(word);
			}
			m++;
        }*/
	  ASMAst body = visit(ctx.funBody());
	  ASMAst function = FUNCTION(id, FORMALS(f), body);
	  this.statements.add(function);
	  tableSimbol.toString();
	  
	  
	  return function;
   }
   @Override
   public ASMAst visitEmptyStatement(EightBitParser.EmptyStatementContext ctx){
      return EMPTY();
	                
   }
   
   @Override
   public ASMAst visitReturnStatement(EightBitParser.ReturnStatementContext ctx){
      return RET(visit(ctx.expr()));
	                
   }
   @Override
   public ASMAst visitAssignStatement(EightBitParser.AssignStatementContext ctx){
	   //System.out.println("Holi");
	  // visit(ctx.id()).genCode();
	/* tableSimbol.put(1,ASSIGN(visit(ctx.id()), visit(ctx.expr())));
	  System.out.println("Holi");
	  ASMAst prueba = tableSimbol.get(1);
	  prueba.genCode();
	  System.out.println("Holi");*///Prueba de la hash
	 //System.out.println(ctx.getText());
	 //System.out.println(ctx.expr().getText());
	  return ASSIGN(visit(ctx.id()), visit(ctx.expr()));
	                
   }
   @Override
   public ASMAst visitBlockStatement(EightBitParser.BlockStatementContext ctx){
	  EightBitParser.ClosedListContext closedList = ctx.closedList();
      return (closedList == null ) ? BLOCK() 
	                               : visit(closedList);
   }
   @Override
   public ASMAst visitClosedList(EightBitParser.ClosedListContext ctx){					  
					   return  BLOCK(ctx.closedStatement().stream()
	                                                      .map( c -> visit(c))
										                  .collect(Collectors.toList()));
	                
   }
   @Override
   public ASMAst visitFormals(EightBitParser.FormalsContext ctx){
	   EightBitParser.IdListContext idList = ctx.idList();
	   return (idList == null ) ? BLOCK()
	                            : visit(idList);
   }
   @Override
   public ASMAst visitIdList(EightBitParser.IdListContext ctx){
	   return  BLOCK(ctx.id().stream()
						     .map( c -> visit(c))
						     .collect(Collectors.toList()));
	
   } 
   @Override
   public ASMAst visitId(EightBitParser.IdContext ctx){
	  return  ID(ctx.ID().getText());
   }
   @Override
    public ASMAst visitArithOperation(EightBitParser.ArithOperationContext ctx) {
	   if (ctx.oper == null)
		   return visit(ctx.arithMonom().get(0));
	   ASMAst oper = ( ctx.oper.getType() == EightBitParser.ADD ) ? ADD : MINUS;
       List<ASMAst> exprs = ctx.arithMonom().stream()
	                                       .map( c -> visit(c) )
										   .collect(Collectors.toList());
	   return exprs.stream()
	               .skip(1)
				   .reduce(exprs.get(0), (opers, expr) ->
	                              OPERATION(oper, opers , expr));
	   
    }
	
	@Override 
	public ASMAst visitCallStatement(EightBitParser.CallStatementContext ctx) { 
		return visitChildren(ctx); 
	}
	
    @Override
    public ASMAst visitArithMonom(EightBitParser.ArithMonomContext ctx){
		System.out.println(ctx.getText());
		ASMAst left = visit(ctx.arithSingle());
		return (ctx.operTDArithSingle() == null) 
		       ? left
		       :ctx.operTDArithSingle().stream()
	                                   .map( c -> visit(c) )
									   .reduce(left, (opers, expr) 
									                      -> FOLD_LEFT(opers , expr));
   } 
   @Override
   public ASMAst visitOperTDArithSingle(EightBitParser.OperTDArithSingleContext ctx){
	   //System.err.println(ctx.getText() + ctx.oper.getText());
	   ASMAst oper = ( ctx.oper.getType() == EightBitParser.MUL ) ? MUL : DIV;
	   ASMAst right = visit(ctx.arithSingle());
	   return OPERATION(oper, NULL, right);
   }
   @Override
   public ASMAst visitArithIdSingle(EightBitParser.ArithIdSingleContext ctx){
      return visit(ctx.id()); // ignoring by now arguments!!
   }
   @Override
   public ASMAst visitExprNum(EightBitParser.ExprNumContext ctx){
      return NUM(Double.valueOf(ctx.NUMBER().getText()));
   }
   @Override
   public ASMAst visitExprTrue(EightBitParser.ExprTrueContext ctx){
      return TRUE;
   }
   @Override
   public ASMAst visitExprFalse(EightBitParser.ExprFalseContext ctx){
      return FALSE;
   }
   
}
  