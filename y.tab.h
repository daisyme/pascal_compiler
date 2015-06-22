/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     DOT = 258,
     PROGRAM = 259,
     ID = 260,
     SEMI = 261,
     CONST = 262,
     NAME = 263,
     EQUAL = 264,
     INTEGER = 265,
     REAL = 266,
     CHAR = 267,
     STRING = 268,
     SYS_CON = 269,
     TYPE = 270,
     LP = 271,
     RP = 272,
     LB = 273,
     RB = 274,
     DOTDOT = 275,
     SYS_TYPE = 276,
     ARRAY = 277,
     OF = 278,
     RECORD = 279,
     COMMA = 280,
     COLON = 281,
     ASSIGN = 282,
     BEGIN1 = 283,
     END = 284,
     SYS_PROC = 285,
     READ = 286,
     IF = 287,
     THEN = 288,
     ELSE = 289,
     REPEAT = 290,
     UNTIL = 291,
     FOR = 292,
     DO = 293,
     TO = 294,
     DOWNTO = 295,
     CASE = 296,
     GOTO = 297,
     GE = 298,
     GT = 299,
     LE = 300,
     LT = 301,
     UNEQUAL = 302,
     PLUS = 303,
     MINUS = 304,
     MUL = 305,
     MOD = 306,
     DIV = 307,
     OR = 308,
     AND = 309,
     SYS_FUNCT = 310,
     VAR = 311,
     FUNCTION = 312,
     PROCEDURE = 313,
     WHILE = 314,
     NOT = 315,
     LABEL = 316
   };
#endif
/* Tokens.  */
#define DOT 258
#define PROGRAM 259
#define ID 260
#define SEMI 261
#define CONST 262
#define NAME 263
#define EQUAL 264
#define INTEGER 265
#define REAL 266
#define CHAR 267
#define STRING 268
#define SYS_CON 269
#define TYPE 270
#define LP 271
#define RP 272
#define LB 273
#define RB 274
#define DOTDOT 275
#define SYS_TYPE 276
#define ARRAY 277
#define OF 278
#define RECORD 279
#define COMMA 280
#define COLON 281
#define ASSIGN 282
#define BEGIN1 283
#define END 284
#define SYS_PROC 285
#define READ 286
#define IF 287
#define THEN 288
#define ELSE 289
#define REPEAT 290
#define UNTIL 291
#define FOR 292
#define DO 293
#define TO 294
#define DOWNTO 295
#define CASE 296
#define GOTO 297
#define GE 298
#define GT 299
#define LE 300
#define LT 301
#define UNEQUAL 302
#define PLUS 303
#define MINUS 304
#define MUL 305
#define MOD 306
#define DIV 307
#define OR 308
#define AND 309
#define SYS_FUNCT 310
#define VAR 311
#define FUNCTION 312
#define PROCEDURE 313
#define WHILE 314
#define NOT 315
#define LABEL 316




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

