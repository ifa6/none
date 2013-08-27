/*
 */
#ifndef __STDIO_H__
#define __STDIO_H__
#include    <stdarg.h>
#include    <stddef.h>


int sprintf(char *buf,const char *fmt,...);
int vsprintf(char *buf,const char *fmt,va_list args);
int printf(const char *fmt,...);
int getchar(void);

#endif
