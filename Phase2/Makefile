
test: mini_l.lex mini_l.y
	bison -d -v mini_l.y
	flex mini_l.lex
	gcc lex.yy.c mini_l.tab.c -ll -o parser

macos:
	rm -f lex.yy.c
	rm -f lexer
	flex mini_l.lex
	gcc lex.yy.c -ll -o lexer

fibonacci:
	cat fibonacci.min | ./parser

primes:
	cat primes.min | ./parser

mytest:
	cat primes.min | ./parser

errortest1:
	cat errortest1.min | ./parser

parser:mini_l.lex mini_l.y
	bison -d -v mini_l.y
	flex mini_l.lex
	gcc lex.yy.c mini_l.tab.c -lfl -o parser


parsermac:mini_l.lex mini_l.y
	bison -d -v mini_l.y
	flex mini_l.lex
	gcc lex.yy.c mini_l.tab.c -ll -o parser

reset:
	rm -f parser mini_l.tab.h
	rm -f parser mini_l.tab.c
	rm -f mini_l.output
	rm -f lex.yy.c
	rm -f lexer
