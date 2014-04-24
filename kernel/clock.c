#include    "kernel.h"
#include    <time.h>

volatile unsigned long jiffies = 0;
static  time_t startup_time;

/*! 时钟中断,可能不太合群,不太协调,毕竟他是整个系统的脉搏,任务繁重 ~*/


int clock_handler(object_t o,int irq){
    (void)irq;
    if(TASK(leading)->ucount) TASK(leading)->ucount--;
    if(!(jiffies % 10)) doint(o,HARDWARE,0,0,0);   /*!-------!*/
    return OK;
}

#define CMOS_READ(addr) ({\
        outb_p(0x80 | addr,0x70);    \
        inb_p(0x71);\
    })

#define BCD_TO_BIN(val) ((val) = ((val) & 0xf) + ((val) >> 4)* 10)

#define MINUTE  60
#define HOUR    (60 * MINUTE)
#define DAY     (24 * HOUR)
#define YEAR    (365 * DAY)

static time_t mktime(Time *tm){
    time_t res;
    static const int month[12] = {
        0,
        31,
        31 + 28,
        31 + 28 + 31,
        31 + 28 + 31 + 30,
        31 + 28 + 31 + 30 + 31,
        31 + 28 + 31 + 30 + 31 + 30,
        31 + 28 + 31 + 30 + 31 + 30 + 31,
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31,
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30,
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31,
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30,
    };

    res = YEAR * (tm->year) + DAY * (tm->year + 3) / 4;
    res += DAY * month[tm->month];
    if(tm->month > 1 && (!(tm->year % 4)))
        res += DAY;
    res += DAY * (tm->day - 1);
    res += HOUR * tm->hour;
    res += MINUTE * tm->minute;
    res += tm->second;
    return res;
}

static Time *cmos_time(void){
    static Time time;
    do{
        time.second = CMOS_READ(0);
        time.minute = CMOS_READ(2);
        time.hour = CMOS_READ(4);
        time.day = CMOS_READ(7);
        time.month = CMOS_READ(8);
        time.year = CMOS_READ(9);
    }while(time.second != CMOS_READ(0));    
    BCD_TO_BIN(time.second);
    BCD_TO_BIN(time.minute);
    BCD_TO_BIN(time.hour);
    BCD_TO_BIN(time.day);
    BCD_TO_BIN(time.month);
    BCD_TO_BIN(time.year);
    time.month--;
    startup_time = mktime(&time);
    return &time;
}

static Time *time = NULL;


static void put_time(Object *this){
    printk("\ew%d/%02d/%02d %02d:%02d:%02d\n",time->year + 2000,time->month + 1,time->day,
            time->hour,time->minute,time->second);
    ret(this->admit,OK);
}

/*! 暂时为没有编译进内核的任务提供打印任务 !*/
static void _print(Object *this){
    printk(this->buffer);
    ret(this->admit,OK);
}

static void _clk(Object *this){
    (void)this;
}

static void clock_init(void){
    self()->fns[READ] = put_time;
    self()->fns[WRITE] = _print;
    self()->fns[HARDWARE] = _clk;
    time = cmos_time();
    outb_p(0x36,0x43);
    outb_p(LATCH&0xff,0x40);
    outb_p(LATCH>>8,0x40);
    put_irq_handler(0,(IrqHandler)clock_handler);
}
int clock_main(void){
    clock_init();
    dorun();
    return 0;
}
