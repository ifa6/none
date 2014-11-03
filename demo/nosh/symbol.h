#ifndef __NOSH_SYMBOL_H__
#define __NOSH_SYMBOL_H__

#include "object.h"
Symbol *lookup(const char *symbol) ;
SymbolList *newSymbolList(Symbol *sym,SymbolList *next);
void delSymbolList(SymbolList *symbols);
Symbol *lookup(const char *symbol);
#endif
