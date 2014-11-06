%{
#include <string.h>
#include <stdio.h>
#include "object.h"
#include "util.h"
#define YYSIZE_T size_t
#define YYCOPY memcpy


extern int yylex(void);

%}

%union {
    Object  *object;
    long    number;
    char    *string;
    Symbol *symbol;
    SymbolList *symbols;
}

%token <number>NUMBER
%token <symbol>SYMBOL
%token <string>STRING
%type <object>atom sexp list sexp_list

%start start

%%

start
    : sexp              { display(eval($1)); }
    | start sexp        { display(eval($2)); }
    ;

sexp
    : atom
    | list
    ;

list
    : '(' ')'           { $$ = newList(NULL);}
    | '(' sexp_list ')' { $$ = newList($2);  }
    | '`' sexp          { $$ = newQuote($2); }
    ;

atom
    : NUMBER            { $$ = newNumber($1); }
    | SYMBOL            { $$ = newSymbol($1); }
    | STRING            { $$ = newString($1); }
    ;

sexp_list
    : sexp
    | sexp sexp_list    { $$ = newCons($1,$2); }
    ;
    
%%

int main(void) {
    built();
    //object_t file = open("/test.l",0);
    //stdin = &file;
    system("ls /bin/");
    return 0;
    yyparse();
}

void yyerror(const char *str,...) {
    printf("lisp : %s\n",str);
}
