#include    <sys/inter.h>

int main(void){
    char *msg = "\eyhello,kennel\ew\n";
    run(CLOCK_PID,WRITE,0,0,msg);    /*! 让CLOCK给我们打印一条Hello消息 !*/
    return 0;
}
