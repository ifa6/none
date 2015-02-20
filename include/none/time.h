#ifndef __NONE_TIME_H__
#define __NONE_TIME_H__
#include <none/types.h>
#include <none/if.h>
#include <sys/inter.h>
#define  TIF_INTR           IF_INTR
#define  TIF_GETTIME        IF_USER1

struct timespec {
    time_t  tv_sec;
    long    tv_nsec;
};

struct tm{
    int tm_sec;
    int tm_min;
    int tm_hour;
    int tm_mday;
    int tm_mon;
    int tm_year;
    int tm_wday;
    int tm_yday;
    int tm_isdst;
};

typedef struct time Time;
struct time {
    int second;
    int minute;
    int hour;
    int day;
    int month;
    int year;
    int week;
    int isdst;
};

static inline time_t time(time_t *sp){
    time_t _time;
    _time = run(CLOCK_PID,TIF_GETTIME,sp,0,0);
    if(sp && _time > 0)
        *sp = _time;
    return _time;
}

#endif
