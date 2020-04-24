
ubuntu:
	rm -f lex.yy.c
	rm -f lexer
	flex mini_l.lex
	gcc lex.yy.c -lfl -o lexer

macos:
	rm -f lex.yy.c
	rm -f lexer
	flex mini_l.lex
	gcc lex.yy.c -ll -o lexer

fibonacci:
	cat fibonacci.min | ./lexer

primes:
	cat primes.min | ./lexer

mytest:
	cat primes.min | ./lexer

errortest1:
	cat errortest1.min | ./lexer

reset:
	rm -f lex.yy.c
	rm -f lexer
