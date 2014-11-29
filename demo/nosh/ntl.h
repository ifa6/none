#ifndef __HELPER_FILE_H__
#define __HELPER_FILE_H__
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdio.h>
#include <none/types.h>
extern int errno;
typedef object_t FILE;

void *realloc(void *buffer,size_t size);
extern FILE *stdin;
extern FILE *stdout;
static inline object_t fileno(FILE *file){return *file;}
static inline int fwrite(void *buffer,size_t cnt,size_t size,FILE *file) {return write(*file,buffer,cnt * size);}
int system(char *);
static inline char *strdup(const char *s) {
    size_t  len = strlen(s) + 1;
    void *new = malloc(len);
    if (new == NULL)
        return NULL;
    return (char *)memcpy(new,s,len);
}
#define isatty(x) x
#define EOF -1
#define YY_INPUT(buf,result,max_size) result = read(fileno(stdin),buf,max_size)
#define fprintf(f,...) printf(__VA_ARGS__)
#endif
