# Makefile for all
#
l = $r/lib

sources = malloc.c\
		 vsprintf.c\
		 printf.c\
		 getchar.c\
		 dorun.c\
		 fork.c\
		 open.c\
		 string.c

$l/libc.a:$(sources:.c=.o)

include	$r/tools/Makefile
