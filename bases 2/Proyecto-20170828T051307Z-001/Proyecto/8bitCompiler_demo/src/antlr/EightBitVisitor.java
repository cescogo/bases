// Generated from grammar/EightBit.g4 by ANTLR 4.5.3
package eightBit.compile;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link EightBitParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface EightBitVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link EightBitParser#eightProgram}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEightProgram(EightBitParser.EightProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#eightFunction}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEightFunction(EightBitParser.EightFunctionContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#formals}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFormals(EightBitParser.FormalsContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#idList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdList(EightBitParser.IdListContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#id}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitId(EightBitParser.IdContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#funBody}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunBody(EightBitParser.FunBodyContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#emptyStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEmptyStatement(EightBitParser.EmptyStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#letStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLetStatement(EightBitParser.LetStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#assignStmtList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssignStmtList(EightBitParser.AssignStmtListContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#closedStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClosedStatement(EightBitParser.ClosedStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#assignStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssignStatement(EightBitParser.AssignStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#whileStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhileStatement(EightBitParser.WhileStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#ifStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStatement(EightBitParser.IfStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#callStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCallStatement(EightBitParser.CallStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#returnStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturnStatement(EightBitParser.ReturnStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#blockStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlockStatement(EightBitParser.BlockStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#closedList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClosedList(EightBitParser.ClosedListContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr(EightBitParser.ExprContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#relMonom}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRelMonom(EightBitParser.RelMonomContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#relOperation}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRelOperation(EightBitParser.RelOperationContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#relOperator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRelOperator(EightBitParser.RelOperatorContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#arithOperation}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArithOperation(EightBitParser.ArithOperationContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#arithMonom}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArithMonom(EightBitParser.ArithMonomContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ArithMinusSingle}
	 * labeled alternative in {@link EightBitParser#arithSingle}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArithMinusSingle(EightBitParser.ArithMinusSingleContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ArithParsSingle}
	 * labeled alternative in {@link EightBitParser#arithSingle}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArithParsSingle(EightBitParser.ArithParsSingleContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ArithIdSingle}
	 * labeled alternative in {@link EightBitParser#arithSingle}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArithIdSingle(EightBitParser.ArithIdSingleContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ArithConstantSingle}
	 * labeled alternative in {@link EightBitParser#arithSingle}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArithConstantSingle(EightBitParser.ArithConstantSingleContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#operTDArithSingle}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOperTDArithSingle(EightBitParser.OperTDArithSingleContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprNum}
	 * labeled alternative in {@link EightBitParser#constant}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprNum(EightBitParser.ExprNumContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprString}
	 * labeled alternative in {@link EightBitParser#constant}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprString(EightBitParser.ExprStringContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprTrue}
	 * labeled alternative in {@link EightBitParser#constant}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprTrue(EightBitParser.ExprTrueContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprFalse}
	 * labeled alternative in {@link EightBitParser#constant}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprFalse(EightBitParser.ExprFalseContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprNull}
	 * labeled alternative in {@link EightBitParser#constant}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprNull(EightBitParser.ExprNullContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#arguments}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArguments(EightBitParser.ArgumentsContext ctx);
	/**
	 * Visit a parse tree produced by {@link EightBitParser#args}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArgs(EightBitParser.ArgsContext ctx);
}