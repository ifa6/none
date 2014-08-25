%top{
#include <stdio.h>
#include <string.h>
#include "util.h"
FILE *stdin;
FILE *stdout;
static inline object_t fileno(FILE *file){return *file;}
static inline char *strdup(const char *s) {
    size_t  len = strlen(s) + 1;
    void *new = malloc(len);
    if (new == NULL)
        return NULL;
    return (char *)memcpy(new,s,len);
}
static inline int fwrite(void *buffer,size_t cnt,size_t size,FILE *file) {return write(*file,buffer,cnt * size);}
#define isatty(x) x
#define EOF -1
#define YY_INPUT(buf,result,max_size) result = read(fileno(stdin),buf,max_size)
#define fprintf(f,...) printf(__VA_ARGS__)
int  errno;
}
%{
typedef struct _Node Node;
#include "help.tab.h"
#include "ast.h"
#if 0
#define c(fmt,...)    printf(fmt,##__VA_ARGS__)
#else
#define c(...)
#endif
%}
%x filter_1 filter_2 filter_3
%x h1 h2 h3 h4 h5 h6 code
s   [ \t\f]
%%
^[^\n]+/\n=+\n              {c("<h1>\n");    BEGIN(filter_1);yylval.string = strdup(yytext);return H1;}
^[^\n]+/\n-+\n              {c("<h2>\n");    BEGIN(filter_1);yylval.string = strdup(yytext);return H2;}
^#/[^#\n]+                  {c("<h1>\n");    BEGIN(h1);}
^##/[^#\n]+                 {c("<h2>\n");    BEGIN(h2);}
^###/[^#\n]+                {c("<h3>\n");    BEGIN(h3);}
^####/[^#\n]+               {c("<h4>\n");    BEGIN(h4);}
^#####/[^#\n]+              {c("<h5>\n");    BEGIN(h5);}
^######/[^#\n]+             {c("<h6>\n");    BEGIN(h6);}
^{s}*```[^ \n]/\n           {c("<code>\n");  BEGIN(code);}
<h1>[^#\n]+/#*\n            {c("<h1>\n");    BEGIN(filter_2);yylval.string = strdup(yytext);return H1;}
<h2>[^#\n]+/#*\n            {c("<h2>\n");    BEGIN(filter_2);yylval.string = strdup(yytext);return H2;}
<h3>[^#\n]+/#*\n            {c("<h3>\n");    BEGIN(filter_2);yylval.string = strdup(yytext);return H3;}
<h4>[^#\n]+/#*\n            {c("<h4>\n");    BEGIN(filter_2);yylval.string = strdup(yytext);return H4;}
<h5>[^#\n]+/#*\n            {c("<h5>\n");    BEGIN(filter_2);yylval.string = strdup(yytext);return H5;}
<h6>[^#\n]+/#*\n            {c("<h6>\n");    BEGIN(filter_2);yylval.string = strdup(yytext);return H6;}
<code>(.|\n)+/\n```\n       {c("<code>\n");  BEGIN(filter_3);yylval.string = strdup(yytext);return CODE;}
<filter_1>\n[-=]+\n         {BEGIN(INITIAL);}
<filter_2>#*\n              {BEGIN(INITIAL);}
<filter_3>\n```\n           {BEGIN(INITIAL);};
^{s}*\n                     {c("<sline>\n");}
^{s}*[-*+]{s}+              {c("<list>");    return LIST;}
{s}*[>]{s}+                 {c("<>>");       return '>';}
[_*`]                       {c("<%c>",yytext[0]);return yytext[0];}
[\n]                        {c("\n");return '\n';}
[^-+*>=#`\n]+               {c("<string>");yylval.string = strdup(yytext);return STRING;}
[ \t\f]+                    {c("< >");}
.                           {c("%c",yytext[0]);}
%%
int yywrap(void){ 
    (void)input;
    (void)yyunput;
    return 1;
}
