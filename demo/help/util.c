#include "util.h"
#include <string.h>
#include <stdio.h>
void *realloc(void *buffer,size_t size){
    void *new;
    new = malloc(size);
    if(new){
        memcpy(new,buffer,size);
    }
    free(buffer);
    return new;
}
