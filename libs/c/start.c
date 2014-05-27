#include <stdlib.h>
#include <stdio.h>
extern int main(int argc,char **argv);
int _start(int argc,char **argv){
    int _v = 0;
    _v = main(argc,argv);
    exit(_v);
}
