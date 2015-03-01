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
#include <sys/inter.h>
#include <z.h>

#define next_entry(x)   ((void*)x) + 32;
struct dir_entry{
    u16     inode;
    char    name[0];
};

int main(int argc,char **argv){
    void *bb;
    struct dir_entry *dir;
    bb = malloc(1024);
    foreach(i,1,argc){
        int curr = open(argv[i],0);
        size_t len;
        if(curr != ERROR){
            while(0 < (len = read(curr,bb,1024))){
                dir = bb;
                foreach(i,0,(len / 32)){
                    if(dir->inode)
                        printf("%10s\n",dir->name);
                    dir = next_entry(dir);
                }
            }
            close(curr);
        }
        printf("\n");
    }
    return 0;
}
