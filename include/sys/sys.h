typedef int (*fn_ptr)();

extern int dofn();
extern int doret();
extern int doget();

fn_ptr sys_call_table[] = {
    [_NR_run] = dofn,
    [_NR_get] = doget,
    [_NR_ret] = doret,
};

int NR_syscalls = sizeof(sys_call_table)/sizeof(fn_ptr);
