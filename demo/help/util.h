#ifndef __HELPER_FILE_H__
#define __HELPER_FILE_H__
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <none/types.h>
typedef object_t FILE;
void *realloc(void *buffer,size_t size);
extern FILE *stdin;
extern FILE *stdout;
#endif
