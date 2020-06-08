%{
#define YY_NO_UNPUT
#include <stdio.h>
#include <stdlib.h>
extern int currLine;
extern char* yytext;
int yyerror(const char* s);
%}

%union{
  char* ident_val;
  int num_val;
 }

%error-verbose
%start Program_start

%token <ident_val> IDENT
%token <num_val> NUMBER

%token FUNCTION
%token BEGIN_PARAMS END_PARAMS BEGIN_LOCALS END_LOCALS BEGIN_BODY END_BODY
%token INTEGER ARRAY
%token OF IF THEN ENDIF ELSE
%token CONTINUE
%token READ WRITE
%token WHILE DO FOR IN BEGINLOOP ENDLOOP
%token TRUE FALSE
%left AND OR ASSIGN
%right NOT
%left ADD SUB MULT DIV MOD EQ NEQ LT GT LTE GTE
%token L_PAREN R_PAREN L_SQUARE_BRACKET R_SQUARE_BRACKET SEMICOLON COLON COMMA
%token RETURN



%%

Program_start:     {printf("Program_start -> epsilon\n");}
                 | Func Program_start
		 {printf("Program_start -> Func Program_start\n");}
;

Func:        FUNCTION Identifier SEMICOLON BEGIN_PARAMS MultipleDefs END_PARAMS BEGIN_LOCALS MultipleDefs END_LOCALS BEGIN_BODY MultipleStat END_BODY
{printf("Func -> FUNCTION Identifier SEMICOLON BEGIN_PARAMS MultipleDefs END_PARAMS BEGIN_LOCALS MultipleDefs END_LOCALS BEGIN_BODY MultipleStat END_BODY\n");}
|FUNCTION Identifier error BEGIN_PARAMS MultipleDefs END_PARAMS BEGIN_LOCALS MultipleDefs END_LOCALS BEGIN_BODY MultipleStat END_BODY
;

SingleDef:     Identifiers COLON INTEGER
{printf("SingleDef -> Identifiers COLON INTEGER\n");}
                 | Identifiers COLON ARRAY L_SQUARE_BRACKET NUMBER R_SQUARE_BRACKET OF INTEGER
		 {printf("SingleDef -> Identifiers COLON ARRAY L_SQUARE_BRACKET NUMBER %d R_SQUARE_BRACKET OF INTEGER;\n", $5);}
;
MultipleDefs:    {printf("MultipleDefs -> epsilon\n");}
                 | SingleDef SEMICOLON MultipleDefs
		 {printf("MultipleDefs -> SingleDef SEMICOLON MultipleDefs\n");}
;

Statement:      Identifiers ASSIGN Expression
{printf("Statement -> Identifiers ASSIGN Expression\n");}
                 | Identifiers error Expression
                 | IF BooleanExpression THEN MultipleStat Else ENDIF {printf("Statement -> IF BooleanExpression THEN MultipleStat Else ENDIF\n");}
                 | WHILE BooleanExpression BEGINLOOP MultipleStat ENDLOOP {printf("Statement -> WHILE BooleanExpression BEGINLOOP MultipleStat ENDLOOP\n");}
                 | DO BEGINLOOP MultipleStat ENDLOOP WHILE BooleanExpression{printf("Statement -> DO BEGINLOOP MultipleStat ENDLOOP WHILE BooleanExpression\n");}
                 | FOR Identifier IN Identifier BEGINLOOP MultipleStat ENDLOOP{printf("Statement -> FOR Identifier IN Identifier BEGINLOOP MultipleStat ENDLOOP\n");}
                 | READ Identifiers {printf("Statement -> READ Identifiers\n");}
                 | WRITE Identifiers {printf("Statement -> WRITE Identifiers\n");}
                 | CONTINUE {printf("Statement -> CONTINUE\n");}
                 | RETURN Expression {printf("Statement -> RETURN Expression\n");}
;
Else:   {printf("Else -> epsilon\n");}
                 | ELSE MultipleStat {printf("Else -> ELSE MultipleStat\n");}
;

MultipleStat:      Statement SEMICOLON MultipleStat
{printf("MultipleStat -> Statement SEMICOLON MultipleStat\n");}
                 | Statement SEMICOLON
		 {printf("MultipleStat -> Statement SEMICOLON\n");}
;


Expression:      Multipliers
{printf("Expression -> Multipliers\n");}
                 | Multipliers ADD Expression{printf("Expression -> Multipliers ADD Expression\n");}
                 | Multipliers SUB Expression {printf("Expression -> Multipliers SUB Expression\n");}
;
Expressions:     {printf("Expressions -> epsilon\n");}
                 | Expression COMMA Expressions {printf("Expressions -> Expression COMMA Expressions\n");}
                 | Expression {printf("Expressions -> Expression\n");}
;

Multipliers:         AddOrSub{printf("Multipliers -> AddOrSub\n");}
                 | AddOrSub MULT Multipliers {printf("Multipliers -> AddOrSub MULT Multipliers\n");}
                 | AddOrSub DIV Multipliers {printf("Multipliers -> AddOrSub DIV Multipliers\n");}
                 | AddOrSub MOD Multipliers {printf("Multipliers -> AddOrSub MOD Multipliers\n");}
;

AddOrSub:            Identifiers
{printf("AddOrSub -> Identifier\n");}
                 | SUB Identifiers {printf("AddOrSub -> SUB Identifier\n");}
                 | NUMBER {printf("AddOrSub -> NUMBER %d\n", $1);}
                 | SUB NUMBER {printf("AddOrSub -> SUB NUMBER %d\n", $2);}
                 | SUB L_PAREN Expression R_PAREN {printf("AddOrSub -> SUB L_PAREN Expression R_PAREN\n");}
                 | NestedExpression {printf("AddOrSub -> NestedExpression\n");}
;

NestedExpression:
  L_PAREN Expression R_PAREN {printf("AddOrSub -> L_PAREN Expression R_PAREN\n");}|
  | Identifiers L_PAREN Expressions R_PAREN {printf("AddOrSub -> Ident L_PAREN Expressions R_PAREN\n");}


BooleanExpression:         CheckforAND
{printf("BooleanExpression -> CheckforNot\n");}
                 | CheckforAND OR BooleanExpression {printf("BooleanExpression -> CheckforAnd OR BooleanExpression\n");}
;

CheckforAND:           CheckforNot
{printf("CheckforAnd -> CheckforNot\n");}
                 | CheckforNot AND CheckforAND{printf("CheckforAnd -> CheckforNot AND CheckforAnd\n");}
;

CheckforNot:            NOT BoolValues
{printf("CheckforNot -> NOT BoolValue\n");}
                 | BoolValues
                 {printf("CheckforNot -> BoolValue\n");}

;
BoolValues:           Expression Relational_operators Expression
{printf("CheckforNot -> Expression Relational_operators Expression\n");}
                 | TRUE
		     {printf("CheckforNot -> TRUE\n");}
                 | FALSE
		     {printf("CheckforNot -> FALSE\n");}
                 | L_PAREN BooleanExpression R_PAREN
		   {printf("CheckforNot -> L_PAREN BooleanExpression R_PAREN\n");}
;

Relational_operators:            EQ
{printf("Relational_operators -> EQ\n");}
                 | NEQ{printf("Relational_operators -> NEQ\n");}
                 | LT{printf("Relational_operators -> LT\n");}
                 | GT{printf("Relational_operators -> GT\n");}
                 | LTE{printf("Relational_operators -> LTE\n");}
                 | GTE{printf("Relational_operators -> GTE\n");}
;

Identifiers: Identifier COMMA Identifiers{printf("Identifiers -> Identifier COMMA Identifiers\n");}
     |Identifier L_SQUARE_BRACKET Expression R_SQUARE_BRACKET
      {printf("Identifiers -> Identifier  L_SQUARE_BRACKET Expression R_SQUARE_BRACKET\n");}
     |Identifier error
     |Identifier
     {printf("Identifiers -> Identifier \n");}


Identifier:      IDENT
{printf("Identifier -> IDENT %s \n", yytext);}

%%


int yyerror(const char* type) {
  printf("ERROR: %s at symbol \"%s\" on line %d\n", type, yytext, currLine);
}
