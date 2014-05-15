#ifndef __TIME_H__
#define __TIME_H__

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

#endif
