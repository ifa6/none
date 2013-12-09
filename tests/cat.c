/*******************************************************************************
 * *****************************************************************************/

#include    <stdlib.h>
#include    <stdio.h>
#include    "../fs/minix.h"

static char tmp[512];
int main(void){
    int file = open("/README",0);
    int len;
    if(file != ERROR){
        if(ERROR != (len = read(file,tmp,512))){
            for(int i = 0;i < len;i++){
                printf("%c",tmp[i]);
            }
        }
    }
}
