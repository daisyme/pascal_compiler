%{
  #include <stdio.h>
  #include <iostream>
  using namespace std;
  #include "y.tab.h"

  int row = 1, col = 1;
  extern "C" {
    int yylex();
    int yywrap();
  }
%}

dot       	"."
program		"program"
semi	  	";"
const	  	"const"
equal	  	"=" 
true		"true"
false		"false"
maxint		"maxint"
type	  	"type"
lp		  	"("
rp		  	")"
lb		  	"["
rb			"]"
dotdot		".."
boolean		"boolean" 
char  		"char"
integer 	"integer"
real 		"real"
array	  	"array"
of		  	"of"
record	 	"record"
end		  	"end"
comma	  	","
colon	  	":"
assign 		":="
begin1	  	"begin"
write 		"write" 
writeln 	"writeln"
read	  	"read"
if		  	"if"
then	  	"then"
else	  	"else"
repeat		"repeat"
until	  	"until"
for		  	"for"
do		  	"do"
to		  	"to"
downto		"downto"
case	  	"case"
goto	  	"goto"
ge		  	">="
gt		  	">"
le		  	"<="
lt		  	"<"
unequal		"<>"
plus	  	"+"
minus	  	"-"
mul		  	"*"
mod		  	"mod"
div		  	"div"
and		  	"and"
or		  	"or"
abs			"abs"
chr 		"chr"
odd 		"odd"
ord 		"ord"
pred 		"pred"
sqr 		"sqr" 
sqrt 		"sqrt" 
succ 		"succ"
var		  	"var"
function	"function"
procedure	"procedure"
while	  	"while"
not		  	"not"
label	  	"label"
num			[0-9]+
alpha		[A-Za-z] 
word	  	("_"|{alpha})("."|"_"|{num}|{alpha})*
%%

"{" {
	char c;
	while (1) {
		cin >> c;
		if (c == '}') {
			break;
		}
		col ++;
		if (c == '\n'){
			row ++;
			col = 1;
		}
	}
}

"//".*\n {
	row ++;
}

"(*" {
	char c;
	while (1) {
		cin >> c;
		if (c == '*'){
			cin >> c;
			if(c == ')')
				break;
		}
		col ++;
		if (c == '\n'){
			row ++;
			col = 1;
		}
	}
}

"\'" { 
	char c;
	std::string s = "";
	int cnt = 0;
	while (1) {
		cin >> c;
		if (c == '\'') break;
		++cnt;
		s.append(1,c); 
	}
		col += cnt + 2;
	if (cnt > 1){
		yylval.val.type = 4;
		yylval.val.sVal = s;
		return STRING;
	} 
	else{
		yylval.val.type = 2;
		yylval.val.cVal = c; 
		return CHAR;
	} 
}

{dot}       { col += yyleng; return DOT; }
{program}   { col += yyleng; return PROGRAM; }
{semi}      { col += yyleng; return SEMI; }
{const}     { col += yyleng; isVal = 1; return CONST; }
{equal}     { col += yyleng; return EQUAL; }
{true}		{
	col += yyleng; 
	yylval.val.type = 3;
	yylval.val.bVal = true;
	return SYS_CON;
}
{false}		{
	col += yyleng; 
	yylval.val.type = 3;
	yylval.val.bVal = false;
	return SYS_CON;
}
{maxint}   { 
	col += yyleng; 
	yylval.val.type = 0;
	yylval.val.iVal = MAXINT;
	return SYS_CON; 
}
{type}     	{ col += yyleng; return TYPE; }
{lp}		{ col += yyleng; return LP; }
{rp}		{ col += yyleng; return RP; }
{lb}		{ col += yyleng; return LB; }
{rb}		{ col += yyleng; return RB; }
{dotdot}	{ col += yyleng; return DOTDOT; }
{boolean}	{ col += yyleng; yylval.type.t = 3; return SYS_TYPE;}
{real}		{ col += yyleng; yylval.type.t = 1; return SYS_TYPE;}
{char}		{ col += yyleng; yylval.type.t = 2; return SYS_TYPE;}
{integer}	{ col += yyleng; yylval.type.t = 0; return SYS_TYPE;}
{array}		{ col += yyleng; return ARRAY; }
{of}		{ col += yyleng; return OF; }
{record}	{ col += yyleng; return RECORD; }
{end}		{ col += yyleng; return END; }
{comma}	  	{ col += yyleng; return COMMA; }
{colon}	  	{ col += yyleng; return COLON; }
{assign}	{ col += yyleng; return ASSIGN; }
{begin1}	{ col += yyleng; return BEGIN1; }
{write} 	{ col += yyleng; return WRITE}
{writeln}	{ col += yyleng; return WRITELN; }
{read}	  	{ col += yyleng; return READ; }
{if}	    { col += yyleng; return IF; }
{then}	  	{ col += yyleng; return THEN; }
{else}		{ col += yyleng; return ELSE; }
{repeat}	{ col += yyleng; return REPEAT; } 
{until}		{ col += yyleng; return UNTIL; }
{for}		{ col += yyleng; return FOR; }
{do}		{ col += yyleng; return DO; }
{to}	  	{ col += yyleng; return TO; }
{downto}	{ col += yyleng; return DOWNTO; }
{case}		{ col += yyleng; return CASE; }
{goto}	  	{ col += yyleng; return GOTO; }
{ge}  	  	{ col += yyleng; return GE; }
{gt}    	{ col += yyleng; return GT; }
{le}	    { col += yyleng; return LE; }
{lt}	  	{ col += yyleng; return LT; }
{unequal}	{ col += yyleng; return UNEQUAL; }
{plus}		{ col += yyleng; return PLUS; }
{minus}		{ col += yyleng; return MINUS; }
{mul}		{ col += yyleng; return MUL; }
{mod}		{ col += yyleng; return MOD; }
{div}		{ col += yyleng; return DIV; }
{and}		{ col += yyleng; return AND; }
{or}	    { col += yyleng; return OR; }
{abs}		{ col += yyleng; yylval.sys_funct = 0; return SYS_FUNCT; }
{chr}		{ col += yyleng; yylval.sys_funct = 1; return SYS_FUNCT; }
{odd}		{ col += yyleng; yylval.sys_funct = 2; return SYS_FUNCT; }
{ord}		{ col += yyleng; yylval.sys_funct = 3; return SYS_FUNCT; }
{pred}		{ col += yyleng; yylval.sys_funct = 4; return SYS_FUNCT; }
{sqr}		{ col += yyleng; yylval.sys_funct = 5; return SYS_FUNCT; }
{sqrt}		{ col += yyleng; yylval.sys_funct = 6; return SYS_FUNCT; }
{succ}		{ col += yyleng; yylval.sys_funct = 7; return SYS_FUNCT; }
{var}		{ col += yyleng; return VAR; }
{function}	{ col += yyleng; return FUNCTION; }
{procedure}	{ col += yyleng; return PROCEDURE; }
{while}	  	{ col += yyleng; return WHILE; }
{not}	    { 
	col += yyleng;
	return NOT; 
}
{label}	  	{ 	
	col += yyleng;
	return LABEL; 
}
("+"|"-"){num}		{
	col += yyleng;
	yylval.val.type = 0;
	yylval.val.iVal = atoi(yytext);
	return INTEGER;
}
("+"|"-"){num}"."{num}  {
	col += yyleng;
	yylval.val.type = 1;
	yylval.val.rVal = atof(yytext);
	return REAL;
}
{word}      { 
	col += yyleng;
	yylval.id = strdup(yytext);
	return ID;
}
[\t\f]      col ++;

\n          { row++; col = 1; }
.           {
              fprintf (stderr, "'%c' (0%o): illegal character at line %d, column %d\n", yytext[0], yytext[0], row, column );
            }
%%

int yywrap(void) {
	return 1;
}
