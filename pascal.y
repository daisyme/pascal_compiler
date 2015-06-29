%{ 
#include <stdio.h>
#include <ctype.h>
#include <need.h>  //...
SymbolTable st;
%}

%union{
	struct val* constVal;
	struct type* Type;
}

%token DOT		// .
%token PROGRAM
%token ID		
%token SEMI		// ;
%token CONST
%token EQUAL	// =
%token INTEGER	// 123
%token REAL		// 123.123
%token CHAR		// 'c'
%token STRING	// "abc"
%token SYS_CON  
%token TYPE
%token LP		// (
%token RP		// )
%token LB		// [
%token RB		// ]
%token DOTDOT	// ..
%token SYS_TYPE 
%token ARRAY
%token OF
%token RECORD
%token COMMA	// ,
%token COLON	// :
%token ASSIGN	// :=
%token BEGIN1
%token END
//sys_proc
%token WRITE WRITELN  
%token READ
%token IF
%token THEN
%token ELSE
%token REPEAT
%token UNTIL
%token FOR
%token DO
%token TO
%token DOWNTO
%token CASE
%token GOTO
%token GE		
%token GT		
%token LE		
%token LT		
%token UNEQUAL	
%token PLUS		
%token MINUS	
%token MUL		
%token MOD
%token DIV
%token OR
%token AND
%token SYS_FUNCT
%token VAR		
%token FUNCTION
%token PROCEDURE
%token WHILE
%token NOT
%token LABEL

%left DOTDOT 

%%

program : program_head routine DOT
	;
program_head : PROGRAM ID SEMI
	;
routine : routine_head routine_body {
		st.enterNewScope();
	}
	;
sub_routine : routine_head routine_body
	;
routine_head : label_part const_part type_part var_part routine_part
	;
label_part : 
	;
const_part : CONST  const_expr_list  
	|  
	;
const_expr_list : const_expr_list  ID  EQUAL  const_value  SEMI {
	st.
}
	|  ID  EQUAL  const_value SEMI
	;
const_value : INTEGER  
	|  REAL  
	|  CHAR  
	|  STRING  
	|  SYS_CON
	;
type_part : TYPE type_decl_list  
	|  
	;
type_decl_list : type_decl_list  type_definition  
	|  type_definition
	;
type_definition : ID  EQUAL  type_decl  SEMI
	;
type_decl : simple_type_decl  
	|  array_type_decl  
	|  record_type_decl
	;
array_type_decl : ARRAY  LB  simple_type_decl  RB  OF  type_decl
	;
record_type_decl : RECORD  field_decl_list  END
	;
field_decl_list : field_decl_list  field_decl  
	|  field_decl
	;
field_decl : name_list  COLON  type_decl  SEMI
	;
name_list : name_list  COMMA  ID  
	|  ID
	;
simple_type_decl : SYS_TYPE  
	|  ID  
	|  LP  name_list  RP  
    |  const_value  DOTDOT  const_value   
    |  MINUS  const_value  DOTDOT  const_value
    |  MINUS  const_value  DOTDOT  MINUS  const_value
    |  ID  DOTDOT  ID
    ;
var_part : VAR  var_decl_list  
	|  
	;
var_decl_list :  var_decl_list  var_decl  
	|  var_decl
	;
var_decl :  name_list  COLON  type_decl  SEMI
	;
routine_part:  routine_part  function_decl  
	|  routine_part  procedure_decl
	|  function_decl  
	|  procedure_decl
	|
	;
function_decl : function_head  SEMI  sub_routine  SEMI
	;
function_head :  FUNCTION  ID  parameters  COLON  simple_type_decl 
	;
procedure_decl :  procedure_head  SEMI  sub_routine  SEMI
	;
procedure_head :  PROCEDURE ID parameters 
	;
parameters : LP  para_decl_list  RP  
	|  
	;
para_decl_list : para_decl_list  SEMI  para_type_list
	|  para_type_list
	;
para_type_list : var_para_list COLON  simple_type_decl  
	|  val_para_list  COLON  simple_type_decl
	;
var_para_list : VAR  name_list
	;
val_para_list : name_list
	;
routine_body : compound_stmt
	;
compound_stmt : BEGIN1  stmt_list  END
	;
stmt_list : stmt_list  stmt  SEMI  
	|  
	;
stmt : INTEGER  COLON  non_label_stmt  
	|  non_label_stmt
	;
non_label_stmt : assign_stmt 
	| proc_stmt 
	| compound_stmt 
	| if_stmt 
	| repeat_stmt 
	| while_stmt 
	| for_stmt 
	| case_stmt 
	| goto_stmt
	;
assign_stmt : ID  ASSIGN  expression
    | ID LB expression RB ASSIGN expression
    | ID  DOT  ID  ASSIGN  expression
    ;
proc_stmt : ID
    |  ID  LP  args_list  RP
    |  WRITE
    |  WRITELN
    |  WRITE  LP  expression_list  RP
    |  WRITELN  LP  expression_list  RP
    |  READ  LP  factor  RP
    ;
if_stmt : IF  expression  THEN  stmt  else_clause
	;
else_clause : ELSE stmt 
	|  
	;
repeat_stmt : REPEAT  stmt_list  UNTIL  expression
	;
while_stmt : WHILE  expression  DO stmt
	;
for_stmt : FOR  ID  ASSIGN  expression  direction  expression  DO stmt
	;
direction : TO 
	| DOWNTO
	;
case_stmt : CASE expression OF case_expr_list  END
	;
case_expr_list : case_expr_list  case_expr  
	|  case_expr
	;
case_expr : const_value  COLON  stmt  SEMI
    |  ID  COLON  stmt  SEMI
    ;
goto_stmt : GOTO  INTEGER
	;
expression_list : expression_list  COMMA  expression  
	|  expression
	;
expression : expression  GE  expr  
	|  expression  GT  expr  
	|  expression  LE  expr
    |  expression  LT  expr  
    |  expression  EQUAL  expr  
	|  expression  UNEQUAL  expr  
	|  expr
	;
expr : expr  PLUS  term  
	|  expr  MINUS  term  
	|  expr  OR  term  
	|  term
	;
term : term  MUL  factor  
	|  term  DIV  factor  
	|  term  MOD  factor 
 	|  term  AND  factor  
 	|  factor
 	;
factor : ID  
	|  ID  LP  args_list  RP  
	|  SYS_FUNCT
	|  SYS_FUNCT  LP  args_list  RP  
	|  const_value  
	|  LP  expression  RP
	|  NOT  factor  
	|  MINUS  factor  
	|  ID  LB  expression  RB
	|  ID  DOT  ID
	;
args_list : args_list  COMMA  expression  
	|  expression
	;

%%

main (){ 
	return yyparse(); 
}

void yyerror (char * s){ 
	fprintf(stderr, “%s\n”,s ) ;
}
