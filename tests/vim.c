#include    <stdlib.h>
#include    <stdio.h>
#include    "../fs/minix.h"

#define STR "ABCDEFGHIJK"
static char *tmp = STR;
int main(void){
    int file = open("/README",0);
    int len;
    if(ERROR != (len = write(file,tmp,sizeof(STR)))){
    }
}
