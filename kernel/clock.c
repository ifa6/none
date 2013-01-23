#include    "kernel.h"
#include    <time.h>

volatile unsigned long jiffies = 0;
static  time_t startup_time;
void unready(Proc *rp);
void pick_proc(void);


Registers *clock_handler(Registers *reg){
    act_proc->registers = reg;
    static Message m = {.type = HARD_INT};
    if(!(jiffies % 10)) interrupt(CLOCK_PID,&m);
    //if(act_proc != proc_ptr) printk("%s -> %s\n",act_proc->pname,proc_ptr->pname);
    act_proc = proc_ptr;
    tss->esp0 = act_proc->esp0;
    ldcr3(act_proc->core);
    return act_proc->registers;
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
void clock_init(void){
    put_irq_handler(0,(IrqHandler)clock_handler);
    cmos_time();
    outb_p(0x36,0x43);
    outb_p(LATCH&0xff,0x40);
    outb_p(LATCH>>8,0x40);
    enable_irq(0);
}
int clock_main(void){
    Message m;
    Time *time;
    time = cmos_time();

    printk("Clock Task runing!\n");
    clock_init();
    while(1){
        recvie(ANY,&m);
        switch(m.type){
            case HARD_INT:pick_proc();break;//printk("\erHARD_INT\ew\n");break;
            case GET_TIME:printk("second:%d ",startup_time);printk("%d/%d/%d %d:%d:%d\n",
                                  time->year + 2000,time->month + 1,time->day,time->hour,time->minute,time->second);break;
        }
    }
    unready(act_proc);
    printk("\eW\eoError:clock is unready!\n\eO\ew");
    while(1);
    return 0;
}
