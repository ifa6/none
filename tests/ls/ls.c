/*******************************************************************************
 *  巫师:
 *      lzy
 *  日辰:
 *      Wed Dec  4 19:58:53 CST 2013
 *  巫术:
 *      只能打印当前目录的ls
 * *****************************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <fs/minix.h>
#include <sys/inter.h>
#include <z.h>
MinixDirentry   dir[10];
int main(void){
    int curr = open("/usr/bin",0);
    size_t len;
    if(curr != ERROR){
        while(0 < (len = read(curr,dir,sizeof(dir)))){
            for(var i = 0;i < (len / sizeof(dir[0]));i++){
                printf("%s\n",dir[i].name);
            }
        }
    }
}
