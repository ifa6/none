#ifndef __NONE_SCNTL_H__
#define __NONE_SCNTL_H__

#include <none/if.h>

/* mm interface */
#define MIF_OPEN    IF_OPEN
#define MIF_CLOSE   IF_CLOSE
#define MIF_CLONE   IF_CLONE
#define MIF_NOPAGE  IF_USER1
#define MIF_WPPAGE  IF_USER2
#define MIF_EXECVP  IF_USER3
#define MIF_WAIT    IF_USER4

/* system interface */
#define SIF_PRI     IF_USER1
#define SIF_DUP2    IF_USER2

#endif
