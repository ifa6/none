#include    "driver.h"
void shared_io_task(Driver *driver){
    Message m;
    pid_t   caller;
    int     rcode;;
    for(;;){
        recvie(ANY,&m);
        caller = m.src;
        switch(m.type){
            case    READ:   rcode = (driver->read)(&m);break;
            case    WRITE:  rcode = (driver->write)(&m);break;
            case    OPEN:   rcode = (driver->open)(&m);break;
            case    CLOSE:  rcode = (driver->close)(&m);break;
            case    IOCTL:  rcode = (driver->ioctl)(&m);break;
            default: rcode = ERROR;
        }
        m.type = REPLY;
        m.status = rcode;
        send(caller,&m);
    }
}
