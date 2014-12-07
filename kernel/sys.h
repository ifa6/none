typedef int (*fn_ptr)();

extern int dofn();
extern int doret();
extern int dohook();
extern int dobuffer();

fn_ptr sys_call_table[] = {
    [_NR_run] = dofn,
    [_NR_ret] = doret,
    [_NR_hook] = dohook,
    [_NR_buffer] = dobuffer,
};

int NR_syscalls = sizeof(sys_call_table)/sizeof(fn_ptr);
