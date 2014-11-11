#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "symbol.h"
#include "util.h"

static void _display(Object *object) ;
static Object *_eval(Object *object,bool evl);
#define error(o,fmt,...) ({fprintf(stdout,"Error: <");_display(o);fprintf(stdout,">"fmt,##__VA_ARGS__);})

static Object * const _false = &(Object){OBJECT_BOOL,{._bool = false}};
static Object * const _true =  &(Object){OBJECT_BOOL,{._bool = true}};
static Object * const _nil = &(Object){OBJECT_NIL,{}};



Object *newObject(int type,ObjectImpl impl) {
    Object *a = NULL;
    a = malloc(sizeof(*a));
    if(a) {
        a->type  = type;
        a->impl = impl;
    }
    return a;
}

void delObject(Object *object) {
    error(object," delObject function unsupport.\n");
}


#define eq(a,b) (0 == strcmp(a,b))

static Object *_car(Object *object) {
    if(object) {
        if(object->type == OBJECT_CONS) {
            return object->impl.car;
        } else if(object->type == OBJECT_LIST) {
            return _car(object->impl.object);
        } else {
            error(object," is not a list.\n");
        }
    }
    return _nil;
}

static Object *_cdr(Object *object) {
    if(object) {
        if(object->type == OBJECT_CONS) {
            return object->impl.cdr;
        } else if(object->type == OBJECT_LIST) {
            return newList(_cdr(object->impl.object));
        } else {
            error(object," is not a list.\n");
        }
    }
    return _nil;
}

static Object *_symbol(Object *object) {
    if(object && object->type == OBJECT_SYMBOL)
        return object->impl.symbol->object;
    else {
        error(object," is not symbol.\n");
    }
    return _nil;
}

static Object *_fncall(Object *fn,Object *args) {
    if(fn && fn->type == OBJECT_SYMBOL){
        args = _eval(args,true);
        fn = _symbol(fn);
        if(fn){
            if(fn->type == OBJECT_FUNCTION){
                return fn->impl.fn(args);
            } else if(fn->type == OBJECT_LAMBDA) {
                printf("lambda unsuppor.\n ");
            }
        }
    } else {
        error(fn," is not a function name or lambda-expression.\n");
    }
    return _nil;
}

static Object *_list(Object *object) {
    if(object && object->type == OBJECT_LIST) {
        return _fncall(_car(object),object->impl.object->impl.cdr);
    } else {
        error(object," is not a list.why do this?\n");
    }
    return object;
}

static Object *_set(Object *object) {
    Object *o = NULL;
    if(object) {
        if(object->type == OBJECT_CONS){
            o = _car(object);
            if(o && o->type == OBJECT_SYMBOL){
                Object *a = _cdr(object);
                if(a && a->type != OBJECT_CONS) {
                    o->impl.symbol->object = a;
                    return a;
                } else {
                    error(object," too many arguments to function call.\n");
                }
            } else {
                error(object," is not a symbol to function.\n");
            }
        } else {
            error(object,"too few arguments to function call.");
        }
    } else {
        error(object,"too few arguments to function call.");
    } 
    return _nil;
}

static char *mergeString(char *str1,char *str2) {
    char *str = NULL;
    if(str1){
        if(str2){
            str = realloc(str1,strlen(str1) + strlen(str2) + 2);
            strcat(str," ");
            strcat(str,str2);
            free(str2);
        } else {
            str = str1;
        }
    } else {
        str = str2;
    }
    return str;
}

static char *merge(Object *object) {
    char *str = NULL;
    if(object){
        if(object->type == OBJECT_STRING) {
            str = strdup(object->impl.string);
        } else if(object->type == OBJECT_CONS) {
            str = mergeString(merge(_car(object)),merge(_cdr(object)));
        } else if(object->type == OBJECT_SYMBOL){
            str = merge(object->impl.symbol->object);
        }
    }
    return str;
}

static Object *_quit(Object *object) {
    exit(0);
    return object;
}

static Object *_exec(Object *object) {
    char *str = NULL;
    Object *o = _nil;
    if(object) {
        str = merge(object);
        if(str) {
            o = newNumber(system(str));
            free(str);
        }
    }
    return o;
}
/* (if bool-exp `exp1 `exp2) 如果bool-exp为真,执行exp1否则执行exp2 */
static Object *_if(Object *object) {
    if(object){
        if(object->type == OBJECT_CONS) {
            Object *o = _car(object);
            if(o && o->type == OBJECT_BOOL) {
                if(o->impl._bool == false){
                    return _eval(_cdr(_cdr(object)),true);
                } else {
                    return _eval(_car(_cdr(object)),true);
                }
            } else {
                error(_car(object)," is not a boolean object.\n");
            }
        }
    }
    return _nil;
}

static Object *_eq(Object *object) {
    if(object) {
        if(object->type == OBJECT_CONS) {
            Object *a = _car(object);
            Object *b = _cdr(object);
            if(a == b) {
                return _true;
            }
        }
    }
    return _false;
}

static Object *builtImpl(Object *(*fn)(Object *)) {
    Object *object = NULL;
    object = malloc(sizeof(*object));
    if(object){
        object->type = OBJECT_FUNCTION;
        object->impl.fn = fn;
    }
    return object;
}

void built(void) {
    lookup("car")->object = builtImpl(_car);
    lookup("cdr")->object = builtImpl(_cdr);
    //lookup("cons")->object = builtImpl(_cons);
    lookup("set")->object = builtImpl(_set);
    lookup("exec")->object = builtImpl(_exec);
    lookup("quit")->object = builtImpl(_quit);
    lookup("if")->object = builtImpl(_if);
    lookup("eq")->object = builtImpl(_eq);
}

static Object *_eval(Object *object,bool evl) {
    if(object) {
        switch(object->type) {
        case OBJECT_SYMBOL:
            if(evl)
                object = _symbol(object);
            break;
        case OBJECT_LIST:
            if(evl)
                object = _list(object);
            else
                object->impl.object = _eval(object->impl.object,evl);
            break;
        case OBJECT_QUOTE:
            object = _eval(object->impl.object,false);
            break;
        case OBJECT_CONS:
            object->impl.car = _eval(object->impl.car,evl);
            object->impl.cdr = _eval(object->impl.cdr,evl);
            break;
        case OBJECT_STRING:
            break;
        case OBJECT_NUMBER:
            break;
        default:
            break;
        }
    }
    return object;
}

Object *eval(Object *object) {
    return _eval(object,true);
}

static void _display(Object *object) {
    if(object){
        switch(object->type){
        case OBJECT_CONS:
            _display(_car(object));
            printf(" ");
            _display(_cdr(object));
            break;
        case OBJECT_LIST:
            printf("(");
            _display(object->impl.object);
            printf(")");
            break;
        case OBJECT_SYMBOL:
            printf("%s",object->impl.symbol->name);
            break;
        case OBJECT_STRING:
            printf("\"%s\"",object->impl.string);
            break;
        case OBJECT_NUMBER:
            printf("%d",object->impl.value);
            break;
        case OBJECT_NIL:
            printf("NIL");
            break;
        case OBJECT_QUOTE:
            printf("`");
            _display(object->impl.object);
            break;
        case OBJECT_FUNCTION:
            printf("<#function %p>",object->impl.fn);
            break;
        case OBJECT_LAMBDA:
            printf("<#lambda %p>",object->impl.fn);
            break;
        default:
            printf("Inval object %d",object->type);
            break;
        }
    } else {
        printf("NIL");
    }
}

void display(Object *object) {
    _display(object);
    printf("\n? ");
}
