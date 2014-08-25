#ifndef __ATTRIBULE_H__
#define __ATTRIBULE_H__
#include <stdio.h>
typedef struct {
    int foregound:8;
    int backgound:8;
    int underscore:1;
    int bold:1;
    int highlighted:1;
    int line:1;
}Attribule;

enum{
    COLOR_Black = 'o',
    COLOR_Red = 'r',
    COLOR_Green = 'g',
    COLOR_Yellow = 'y',
    COLOR_Blue = 'b',
    COLOR_Purple = 'v',
    COLOR_DartGreen = 'h',
    COLOR_WHITE = 'w',
}Color;

#define a_fg(s,...)          ((s).foregound __VA_ARGS__)
#define a_bg(s,...)          ((s).backgound __VA_ARGS__)
#define a_underscore(s,...)  ((s).underscor __VA_ARGS__)
#define a_bold(s,...)        ((s).bold __VA_ARGS__)
#define a_highlighted(s,...) ((s).hightlighted __VA_ARGS__)
#define a_line(s,...)        ((s).line __VA_ARGS__)

#define mkfg(c) = (c + 30)
#define mkbg(c) = (c + 40)

static inline void atrb(Attribule attrib,const char *msg){
    if(attrib.highlighted)
        printf("\el");
    printf("\e%c",attrib.foregound);
    printf("%s ",msg);
}

#endif
