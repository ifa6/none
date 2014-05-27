#include    <stdarg.h>
#include    <stddef.h>
#include    "kernel.h"

extern void cons_print(int cons,const char *buf,count_t count);

static  char buf[1024];

extern int printk(const char *fmt,...){
    va_list args;
    int i;

    va_start(args,fmt);
    i=vsprintf(buf,fmt,args);
    cons_print(0,buf,i);
    return i;

}

extern void printx(const char *data,count_t count){
    foreach(i,0,count){
        if(!(i % 16)){
            if(i){
                printk("  ");
                foreach(j,0,16){
                    char c = data[i - 16 + j];
                    printk("%c",((c > ' ')  && (c < 127)) ? c : '.');
                }
                printk("\n");
            }
            printk("%04X : ",i);
        }else if(!(i % 8 )){
            printk("   ");
        }
        printk("%02HX ",data[i]);
    }
    printk("\n");
}
