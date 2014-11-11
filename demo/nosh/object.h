#ifndef __NOSH_OBJECT_H__
#define __NOSH_OBJECT_H__
#include <stdbool.h>

extern int yylineno;
void yyerror(const char *s,...);

typedef struct _Object Object;
typedef struct _Symbol Symbol;
typedef struct _SymbolList SymbolList;

typedef enum {
    OBJECT_INVAL,
    OBJECT_NIL,
    OBJECT_CONS,
    OBJECT_LIST,
    OBJECT_BOOL,
    OBJECT_QUOTE,
    OBJECT_SYMBOL,
    OBJECT_NUMBER,
    OBJECT_STRING,
    OBJECT_LAMBDA,
    OBJECT_FUNCTION,
} ObjectType;

typedef union {
    int    value;
    bool   _bool;
    Object *object;
    char   *string;
    Symbol *symbol;
    struct { Object *car ,*cdr; };
    struct { Object *args,*sexp;};
    Object *(*fn)(Object *);
}ObjectImpl;

struct _Object {
    ObjectType type;
    ObjectImpl impl;
};

struct _Symbol {
    char        *name;
    Object      *object;
    SymbolList  *symbols;
};

struct _SymbolList {
    Symbol *symbol;
    SymbolList *next;
};

Object *newObject(int type,ObjectImpl impl);
void delObject(Object *object);
Object *eval(Object *object);
void display(Object *);
void built(void);

#define objImpl(...)    (ObjectImpl){ __VA_ARGS__ }
#define newCons(a,d)    newObject(OBJECT_CONS  ,objImpl(.car = a,.cdr = d))
//#define newList(obj)    newObject(OBJECT_LIST  ,objImpl(.object = obj))
static inline Object *newList(Object *object) {
    if(object && object->type != OBJECT_CONS)
        object = newCons(object,NULL);
    return newObject(OBJECT_LIST,objImpl(.object = object));
}
#define newQuote(obj)   newObject(OBJECT_QUOTE ,objImpl(.object = obj))
#define newNumber(num)  newObject(OBJECT_NUMBER,objImpl(.value = num))
#define newString(str)  newObject(OBJECT_STRING,objImpl(.string = str))
#define newSymbol(sym)  newObject(OBJECT_SYMBOL,objImpl(.symbol = sym))
#endif
