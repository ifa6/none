#ifndef __NONE_TIME_H__
#define __NONE_TIME_H__
#include <none/types.h>
#include <sys/inter.h>
enum{
    GETTIME = 0,
    HANDLER = 1,
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
struct time{
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
    _time = run(CLOCK_PID,GETTIME,.ptr = sp);
    if(sp)
        *sp = _time;
    return _time;
}

#endif
