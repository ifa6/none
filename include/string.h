#ifndef STRING_H
#define STRING_H
#include    <stddef.h>
#include    <types.h>
void * memcpy(void * dest,const void * src, int n);
void * memset(void * dest,int ch,int n);
char * strcpy(char * dest,const char *src);
size_t strlen(const char *str);
int strncmp(const char  *s1,const char *s2,size_t len);
#endif
