#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "util.h"
#include "symbol.h"

#define error(o,fmt,...) ({printf("Error: ");display(o);printf(fmt,##__VA_ARGS__);})

static Object *_eval(Object *object,bool evl);

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
    return NULL;
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
    return NULL;
}

static Object *_symbol(Object *object) {
    if(object && object->type == OBJECT_SYMBOL)
        return object->impl.symbol->object;
    else {
        error(object," is not symbol.\n");
    }
    return object;
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
    return NULL;
}

static Object *_list(Object *object) {
    //Object *lst = NULL;
    if(object && object->type == OBJECT_LIST) {
        return _fncall(_car(object),object->impl.object->impl.cdr);
#if 0
        lst = object->impl.object;
        if(lst) {
            if(lst->type == OBJECT_CONS) {
                return _fncall(_car(lst),lst->impl.cdr);
            } else if(lst->type == OBJECT_SYMBOL) {
                return _fncall(lst,NULL);
            } 
            return lst;
        }
#endif
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
                o->impl.symbol->object = _cdr(object);
                return o->impl.symbol->object;
            } else {
                error(object," is not a symbol.\n");
            }
        } else {
            error(object," arg");
        }
    } else {
        error(object,"too few arguments.");
    } 
    return object;
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
    Object *o = NULL;
    if(object) {
        str = merge(object);
        if(str) {
            o = newNumber(system(str));
            free(str);
        }
    }
    return o;
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
}

static Object *_eval(Object *object,bool evl) {
    if(object) {
        switch(object->type) {
        case OBJECT_SYMBOL:
            if(evl)
                object = _eval(_symbol(object),evl);
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
}
