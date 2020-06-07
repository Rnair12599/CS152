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
     IDENT = 258,
     NUMBER = 259,
     FUNCTION = 260,
     BEGIN_PARAMS = 261,
     END_PARAMS = 262,
     BEGIN_LOCALS = 263,
     END_LOCALS = 264,
     BEGIN_BODY = 265,
     END_BODY = 266,
     INTEGER = 267,
     ARRAY = 268,
     OF = 269,
     IF = 270,
     THEN = 271,
     ENDIF = 272,
     ELSE = 273,
     CONTINUE = 274,
     READ = 275,
     WRITE = 276,
     WHILE = 277,
     DO = 278,
     FOR = 279,
     IN = 280,
     BEGINLOOP = 281,
     ENDLOOP = 282,
     TRUE = 283,
     FALSE = 284,
     ASSIGN = 285,
     OR = 286,
     AND = 287,
     NOT = 288,
     GTE = 289,
     LTE = 290,
     GT = 291,
     LT = 292,
     NEQ = 293,
     EQ = 294,
     MOD = 295,
     DIV = 296,
     MULT = 297,
     SUB = 298,
     ADD = 299,
     L_PAREN = 300,
     R_PAREN = 301,
     L_SQUARE_BRACKET = 302,
     R_SQUARE_BRACKET = 303,
     SEMICOLON = 304,
     COLON = 305,
     COMMA = 306,
     RETURN = 307
   };
#endif
/* Tokens.  */
#define IDENT 258
#define NUMBER 259
#define FUNCTION 260
#define BEGIN_PARAMS 261
#define END_PARAMS 262
#define BEGIN_LOCALS 263
#define END_LOCALS 264
#define BEGIN_BODY 265
#define END_BODY 266
#define INTEGER 267
#define ARRAY 268
#define OF 269
#define IF 270
#define THEN 271
#define ENDIF 272
#define ELSE 273
#define CONTINUE 274
#define READ 275
#define WRITE 276
#define WHILE 277
#define DO 278
#define FOR 279
#define IN 280
#define BEGINLOOP 281
#define ENDLOOP 282
#define TRUE 283
#define FALSE 284
#define ASSIGN 285
#define OR 286
#define AND 287
#define NOT 288
#define GTE 289
#define LTE 290
#define GT 291
#define LT 292
#define NEQ 293
#define EQ 294
#define MOD 295
#define DIV 296
#define MULT 297
#define SUB 298
#define ADD 299
#define L_PAREN 300
#define R_PAREN 301
#define L_SQUARE_BRACKET 302
#define R_SQUARE_BRACKET 303
#define SEMICOLON 304
#define COLON 305
#define COMMA 306
#define RETURN 307




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 10 "mini_l.y"
{
  char* ident_val;
  int num_val;
 }
/* Line 1529 of yacc.c.  */
#line 158 "mini_l.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

