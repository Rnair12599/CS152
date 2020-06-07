%{
   #include "mini_l.tab.h"
   int currLine = 1;
   int currPos = 1;
%}

DIGIT [0-9]
LOWER [a-z]
UPPER [A-Z]
ALPHA [a-zA-Z]
ALPHANUM [0-9a-zA-Z]


%%
"beginparams" {return BEGIN_PARAMS; currPos += yyleng;} //ORGANIZATIONAL KEYWORDS
"endparams" {return END_PARAMS; currPos += yyleng;}
"beginlocals" {return BEGIN_LOCALS; currPos += yyleng;}
"endlocals" {return END_LOCALS; currPos += yyleng;}
"beginbody" {return BEGIN_BODY; currPos += yyleng;}
"endbody" {return END_BODY; currPos += yyleng;}

"of" {return OF; currPos += yyleng;}  //PROGRAMATIC KEYWORDS
"read" {return READ; currPos += yyleng;}
"do" {return DO; currPos += yyleng;}
"beginloop" {return BEGINLOOP; currPos += yyleng;}
"if" {return IF; currPos += yyleng;}
"then" {return THEN; currPos += yyleng;}
"continue" {return CONTINUE; currPos += yyleng;}
"function" {return FUNCTION; currPos += yyleng;}
"endif" {return ENDIF; currPos += yyleng;}
"write" {return WRITE; currPos += yyleng;}
"endloop" {return ENDLOOP; currPos += yyleng;}
"while" {return WHILE; currPos += yyleng;}
"else" {return ELSE; currPos += yyleng;}
"for" {return FOR; currPos += yyleng;}
"return" {return RETURN; currPos += yyleng;}

"and" {return AND; currPos += yyleng;} //LOGICAL KEYWORDS
"or" {return OR; currPos += yyleng;}
"false" {return FALSE; currPos += yyleng;}
"true" {return TRUE; currPos += yyleng;}
"not" {return NOT; currPos += yyleng;}

"integer" {return INTEGER; currPos += yyleng;}  //VARIABLE TYPES
"array" {return ARRAY; currPos += yyleng;}

";" {return SEMICOLON; currPos += yyleng;}   //SYMBOL KEYWORDS
":" {return COLON; currPos += yyleng;}
"," {return COMMA; currPos += yyleng;}
"(" {return L_PAREN; currPos += yyleng;}
")" {return R_PAREN; currPos += yyleng;}
"[" {return L_SQUARE_BRACKET; currPos += yyleng;}
"]" {return R_SQUARE_BRACKET; currPos += yyleng;}
":=" {return ASSIGN; currPos += yyleng;}

"+" {return ADD; currPos += yyleng;} //LOGICAL AND ARITHEMETIC SYMBOLS
"-" {return SUB; currPos += yyleng;}
"*" {return MULT; currPos += yyleng;}
"/" {return DIV; currPos += yyleng;}
"%" {return MOD; currPos += yyleng;}
"==" {return EQ; currPos += yyleng;}
"<>" {return NEQ; currPos += yyleng;}
"<" {return LT; currPos += yyleng;}
">" {return GT; currPos += yyleng;}
"<=" {return LTE; currPos += yyleng;}
">=" {return GTE; currPos += yyleng;}

"\n"		{currLine++; currPos = 1;} //ESCAPE CHARACTERS
[ \t]+		{currPos += yyleng;}

"##".* 		{currPos = 1;}   //COMMENT CHARACTER


{ALPHA}(({ALPHANUM}|[_])*{ALPHANUM})?[_]+ {
  printf("Error at line %d , column %d: identifier \"%s\" cannot end with an underscore\n", currLine, currPos, yytext);
  exit(1);
}

([_]({ALPHANUM}|[_])+)|({DIGIT}+({ALPHA}|[_])({ALPHANUM}|[_])*) {
  printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", currLine, currPos, yytext);
  exit(1);
}

{DIGIT}+ {
  return NUMBER;
  currPos += yyleng;
}

{ALPHA}(({ALPHANUM}|[_])*{ALPHANUM})? {
  return IDENT;
  currPos += yyleng;
}


. {
  printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext);
  exit(1);
}

%%
int yyparse();
int main(int argc, char ** argv)
{
  if(argc >= 2){
      yyin = fopen(argv[1], "r");
      if(yyin == NULL)
      {
         yyin = stdin;
      }
   }
   else
  {
      yyin = stdin;
   }

	yyparse();
  return 0;
}
