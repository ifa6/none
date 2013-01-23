typedef int (*fn_ptr)();

extern int proc_receive();
extern int proc_send();

fn_ptr sys_call_table[] = {proc_send,proc_receive,};

int NR_syscalls = sizeof(sys_call_table)/sizeof(fn_ptr);
