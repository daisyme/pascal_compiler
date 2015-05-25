%{
  /* Author: Chiba */
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include <ctype.h>
  #include "y.tab.h"

  #define Hash_Size 1000005
  const int Hash_Seed = 31;

  int hashTable[Hash_Size];
  int namePart = 0;

  int BKDRhash(char *s)
  {
  	int n = strlen(s);
  	int i;
  	int res = 0;
  	for (i = 0; i < n; ++i) {
  		res = (res * Hash_Seed + s[i]) % Hash_Size;
  	}
  	return res;
  }

  int isInt(char *s) {
  	int p = 0;
  	if (s[0] == '+' || s[0] == '-') p = 1;
  	int i;
  	int n = strlen(s);
  	for (i = p; i < n; ++i) {
  		if (!isdigit(s[i])) return 0;
  	}
  	return 1;
  }
%}

dot       	"."
program		"program"
semi	  	";"
const	  	"const"
equal	  	"="
sys_con		"true"|"false"|"maxint"
type	  	"type"
lp		  	"("
rp		  	")"
lb		  	"["
rb			"]"
dotdot		".."
sys_type	"boolean"|"char"|"integer"|"real"
array	  	"array"
of		  	"of"
record	 	"record"
end		  	"end"
comma	  	","
colon	  	":"
assign 		":="
begin	  	"begin"
sys_proc	"write"|"writeln"
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
sys_funct	"abs"|"chr"|"odd"|"ord"|"pred"|"sqr"|"sqrt"|"succ"
var		  	"var"
function	"function"
procedure	"procedure"
while	  	"while"
not		  	"not"
label	  	"label"
word	  	[A-Za-z0-9]+("."[A-Za-z0-9]+)*
%%

"{" {
	char c;
	while (1) {
		c = input();
		if (c == '}') break;
	}
}
"//".*\n {
}
"\'" { 
	char c;
	int cnt = 0;
	while (1) {
		c = input();
		if (c == '\'') break;
		++cnt;
	}
	if (cnt > 1) return STRING;
	else return CHAR;
}

{dot}       { return DOT; }
{program}   { return PROGRAM; }
{semi}      { return SEMI; }
{const}     { namePart = 1; return CONST; }
{equal}     { return EQUAL; }
{sys_con}   { return SYS_CON; }
{type}     	{ namePart = 1; return TYPE;}
{lp}		{ return LP; }
{rp}		{ return RP; }
{lb}		{ return LB; }
{rb}		{ return RB; }
{dotdot}	{ return DOTDOT; }
{sys_type}	{ return SYS_TYPE; }
{array}		{ return ARRAY;}
{of}		{ return OF;}
{record}	{ return RECORD;}
{end}		{ return END;}
{comma}	  	{ return COMMA;}
{colon}	  	{ return COLON;}
{assign}	{ return ASSIGN;}
{begin}		{ namePart = 0; return BEGIN;}
{sys_proc}	{ return SYS_PROC;}
{read}	  	{ return READ;}
{if}	    { return IF;}
{then}	  	{ return THEN;}
{else}		{ return ELSE;}
{repeat}	{ return REPEAT;}
{until}		{ return UNTIL;}
{for}		{ return FOR;}
{do}		{ return DO;}
{to}	  	{ return TO;}
{downto}	{ return DOWNTO;}
{case}		{ return CASE;}
{goto}	  	{ return GOTO;}
{ge}  	  	{ return GE;}
{gt}    	{ return GT;}
{le}	    { return LE;}
{lt}	  	{ return LT;}
{unequal}	{ return UNEQUAL;}
{plus}		{ return PLUS;}
{minus}		{ return MINUS;}
{mul}		{ return MUL;}
{mod}		{ return MOD;}
{div}		{ return DIV;}
{and}		{ return AND;}
{or}	    { return OR;}
{sys_funct}	{ return SYS_FUNCT;}
{var}		{ namePart = 0; return VAR;}
{function}	{ namePart = 0; return FUNCTION;}
{procedure}	{ namePart = 0; return PROCEDURE;}
{while}	  	{ return WHILE;}
{not}	    { return NOT;}
{label}	  	{ return LABEL;}
{word}      {
	int i;
	int n = strlen(yytext);
	if (isalpha(yytext[0]) || yytext[0]=='_') { 
		int noDot = 1;
		for (i = 0; i < n; ++i) {
			if (yytext[i]=='.') {
				noDot = 0;
				break;
			}
		}
		if (noDot) {
			if (namePart) {
				hashTable[BKDRhash(yytext)] = 1;
				return NAME;
			}
			else {
				if (hashTable[BKDRhash(yytext)]) return NAME;
				else {
					return ID;
				}
			}
		}
	}
	else { 
		if (yytext[0] == '+' || yytext[0] == '-' && n > 1) {

		}
		else {
			if (isInt(yytext)) return INTEGER;
			char a[256] = {0}, b[256] = {0};
			int dot = -1;
			for (i = 0; i < n; ++i) {
				if (yytext[i] == '.' || yytext[i] == 'e' || yytext[i] == 'E')  {
					dot = i;
					break;
				}
				a[i] = yytext[i];
			}
			if (dot > 0 && dot != n-1) {
				for (i = dot + 1; i < n; ++i) {
					b[i - dot - 1] = yytext[i];
				}
				if (isInt(a) && isInt(b)) return REAL;
			}
		}
	}
}
. | \n {
}
%%

int yywrap(void) {
	return 1;
}
