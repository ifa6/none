#include <stdio.h>
#include <none/fcntl.h>
#include <sys/inter.h>
#include <string.h>
#include <stdlib.h>

int main(int argc,char **argv) {
    if(argc < 2) {
        printf("Usage : debug subcommand [args]\n");
        return -1;
    }
    if(!strcmp(argv[1],"inode")) {
        return run1(ROOTFS_PID,IF_USER15,atoi(argv[2]));
    } else if (!strcmp(argv[1],"super")) {
        return run0(ROOTFS_PID,IF_USER14);
    } else {
        printf("unkown subcommand %s.\n",argv[1]);
    }
    return -1;
}
