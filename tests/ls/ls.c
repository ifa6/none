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
int main(int argc,char **argv){
    foreach(i,1,argc){
        int curr = open(argv[i],0);
        size_t len;
        if(curr != ERROR){
            while(0 < (len = read(curr,dir,sizeof(dir)))){
                foreach(i,0,(len / sizeof(dir[0]))){
                    printf("%10s ",dir[i].name);
                    if(i && !(i % 4)) printf("\n");
                }
            }
            close(curr);
        }
        printf("\n");
    }
    return 0;
}
