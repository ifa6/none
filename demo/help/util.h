#ifndef __HELPER_FILE_H__
#define __HELPER_FILE_H__
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <none/types.h>
typedef object_t FILE;
void *realloc(void *buffer,size_t size);
extern FILE *stdin;
extern FILE *stdout;
static inline char *strdup(const char *s) {
    size_t  len = strlen(s) + 1;
    void *new = malloc(len);
    if (new == NULL)
        return NULL;
    return (char *)memcpy(new,s,len);
}
#endif
