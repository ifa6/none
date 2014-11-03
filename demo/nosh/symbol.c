#include <stdlib.h>
#include <string.h>
#include "symbol.h"
#include "util.h"

#define NHASH   9997

static Symbol symbolTable[NHASH];

static unsigned hashSymbol(const char *symbol) {
    unsigned hash = 0;
    unsigned c;
    while(0 != (c = *symbol++)) hash = hash * 9 ^ c;
    return hash;
}

Symbol *lookup(const char *symbol) {
    Symbol *sp = &symbolTable[hashSymbol(symbol) % NHASH];
    int scount = NHASH;
    while(--scount >= 0) {
        if(sp->name && !strcmp(sp->name,symbol))
            return sp;
        if(!sp->name) {
            sp->name    = strdup(symbol);
            sp->object  = NULL;
            sp->symbols = NULL;
            return sp;
        }
        if(++sp >= symbolTable + NHASH) 
            sp = symbolTable;
    }
    yyerror("symbol table overflow\n");
    exit(1);
}

SymbolList *newSymbolList(Symbol *symbol,SymbolList *next) {
    SymbolList *sl = malloc(sizeof(SymbolList));
    if(sl) {
        sl->symbol = symbol;
        sl->next = next;
    }
    return sl;
}

void delSymbolList(SymbolList *symbols) {
    SymbolList *symbol;
    while(symbols) {
        symbol = symbols->next;
        free(symbols);
        symbols = symbol;
    }
}

