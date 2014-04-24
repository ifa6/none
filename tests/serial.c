#include <sys/inter.h>
#include <string.h>
int main(void){
    char *msg = "hello serial!";
    int len = sizeof("hello,serial");
    char *p = (void*)_push(msg,len);
    run(RS_PID,WRITE,.count = len,.ptr = p);
    _pop(p);
    return 0;
}
