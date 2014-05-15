/*******************************************************************************
 *  巫师:
 *      lzy
 *  日辰:
 *      Wed Dec  4 19:58:53 CST 2013
 *  巫术:
 *      只能打印当前目录的ls
 * *****************************************************************************/
#include    <stdlib.h>
#include    <stdio.h>
#include    <fs/minix.h>
#include <sys/inter.h>
MinixDirentry   dir[10];
int main(void){
    int curr = open("/boot",0);    
    if(curr != ERROR){
        if(ERROR != read(curr,dir,512)){
            for(int i = 0;i < 10;i++){
                printf("%s\n",dir[i].name);
            }
        }
    }
}
