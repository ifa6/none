

#
#   
#   X86硬件相关处理包括x86中断,时钟中断,硬件中断等入口,系统调用入口也在该文件处理
#   
#
#include    <const.h>

.globl	divide_error               # 除法出错
.globl	single_step_exception      # 单步异常
.globl	nmi                        # nmi
.globl	breakpoint_exception       # 断点
.globl	overflow                   # 溢出
.globl	bounds_check               # 边界检测
.globl	inval_opcode               # 无效操作码
.globl	copr_not_available         # 协处理器无效
.globl	double_fault               # 双重错误
.globl	copr_seg_overrun           # 协处理器段越界
.globl	inval_tss                  # 无效的任务段
.globl	segment_not_present        # 段不存在
.globl	stack_exception            # 栈异常
.globl	general_protection         # 常规错误
.globl	page_fault                 # 页异常
.globl	copr_error                 # 协处理器错误
.globl  none
.globl  sys_call
.globl  switch_proc

.globl  _null
.globl  do_keybord
.globl  do_call

.globl  hwint00
.globl  hwint01
.globl  hwint02
.globl  hwint03
.globl  hwint04
.globl  hwint05
.globl  hwint06
.globl  hwint07
.globl  hwint08
.globl  hwint09
.globl  hwint10
.globl  hwint11
.globl  hwint12
.globl  hwint13
.globl  hwint14
.globl  hwint15

.globl  jiffies

.globl  NR_syscalls,sys_call_table
.globl  irq_table,act_registers,act_core



.macro save
    
    pushal   
    pushl   %es
    pushl   %ds
    pushl   %fs
    pushl   %gs
    movl    $0x10,%eax
    movl    %eax,%ds
    movl    %eax,%es
    movl    %eax,%fs
    movl    %eax,%gs
.endm

.macro recov
    popl    %gs
    popl    %fs
    popl    %ds
    popl    %es
    popal
.endm

.text
# 除法出错处理
divide_error:
    push    $0                  #人工设置错误号
    pushl   $do_divide_error
error_code:
    xchgl   %eax,4(%esp)        #保存%eax,并将错误号放入%eax
    pushl   %ecx
    pushl   %edx
    xchgl   %ebx,8(%esp)         #保存%ebx,并将处理函数指针放入%ebx
    pushl   %ebp
    pushl   %esi
    pushl   %edi
    pushl   %es
    pushl   %ds
    pushl   %fs
    pushl   %gs
    pushl   %esp
    pushl   %eax
    movl    $0x10,%eax
    movw    %ax,%ds
    movw    %ax,%es
    movw    %ax,%fs
    call    *%ebx
    addl    $8,%esp
    popl    %gs
    popl    %fs
    popl    %ds
    popl    %es
    popl    %edi
    popl    %esi
    popl    %ebp
    popl    %ebx
    popl    %edx
    popl    %ecx
    popl    %eax
    iret

# 调试中断
single_step_exception:
    pushl   $0
    pushl   $do_debug
    jmp     error_code

#_nmi
nmi:
    pushl   $0
    pushl   $do_nmi
    jmp     error_code

breakpoint_exception:
    pushl   $0
    pushl   $do_breakpoint
    jmp     error_code

overflow:
    pushl   $0
    pushl   $do_overflow
    jmp     error_code

bounds_check:
    pushl   $0
    push    $do_bounds_check
    jmp     error_code

inval_opcode:
    pushl   $0
    pushl   $do_inval_opcode
    jmp     error_code

copr_not_available:
    pushl   $0
    pushl   $do_copr_not_available
    jmp     error_code

double_fault:
    pushl   $do_double_fault
    jmp     error_code

copr_seg_overrun:
    pushl   $0
    pushl   $do_copr_seg_overrun
    jmp     error_code

inval_tss:
    pushl   $do_inval_tss
    jmp     error_code

segment_not_present:
    pushl   $do_segment_not_present
    jmp     error_code

stack_exception:
    pushl   $do_stack_exception
    jmp     error_code

general_protection:
    pushl   $do_general_protection
    jmp     error_code

page_fault:
    pushl   $do_page_fault
    jmp     error_code

copr_error:
    pushl   $0
    pushl   $do_copr_error
    jmp     error_code

none:
    pushl   $0
    pushl   $do_none
    jmp     error_code

# hwint01-07
# 
#define  hwint_master(irq) \
    save;                        \
    inb     $INT2_CTLMASK,%al;   \
    orb     $(1<<(irq)),%al;       \
    outb    %al,$INT_CTLMASK;    \
    movb    $0x20,%al;   \
    outb    %al,$INT_CTL; \
    movl    $irq,%eax;\
    sti; \
    push    $irq;   \
    call    *irq_table(,%eax,4);    \
    addl    $4,%esp;    \
    cli; \
    inb     $INT_CTLMASK,%al;    \
    andb    $(~(1<<(irq))),%al; \
    outb    %al,$INT_CTLMASK;    \
    recov;   \
    iret;    

hwint00:
    save;                        
    inb     $INT2_CTLMASK,%al;   
    orb     1,%al;       
    outb    %al,$INT_CTLMASK;    
    movb    $0x20,%al;   
    outb    %al,$INT_CTL; 

    incl    jiffies

#sti; 
    pushl   %esp
    movl    $0,%eax
    call    *irq_table(,%eax,4)     //不用恢复ESP
    movl    %eax,%esp
0:
    inb     $INT_CTLMASK,%al;    
    andb    $(~1),%al; 
    outb    %al,$INT_CTLMASK;    
    recov;   
    iret;    

hwint01:
    hwint_master(1);
hwint02:
    hwint_master(2);
hwint03:
    hwint_master(3);
hwint04:
    hwint_master(4);
hwint05:
    hwint_master(5);
hwint06:
    hwint_master(6);
hwint07:
    hwint_master(7);
# hwinnt09-15
#define  hwint_slave( irq) \
    save;    \
    inb     $INT2_CTLMASK,%al;   \
    orb     $(1<<(irq-8)),%al; \
    outb    %al,$INT2_CTLMASK;  \
    movb    $0x20,%al;   \
    outb    %al,$INT_CTL; \
    jmp .+2;     \
    outb    %al,$INT2_CTL;    \
    movl    $irq,%eax;\
    sti;     \
    pushl   $irq;   \
    call    *irq_table(,%eax,4);  \
    addl    $4,%esp;\
    cli;         \
    inb     $INT2_CTLMASK,%al;   \
    andb    $(~(1<<(irq-8))),%al;   \
    outb    %al,$INT2_CTLMASK;   \
    recov;   \
    iret;    
hwint08:
    hwint_slave(8);
hwint09:
    hwint_slave(9);
hwint10:
    hwint_slave(10);
hwint11:
    hwint_slave(11);
hwint12:
    hwint_slave(12);
hwint13:
    hwint_slave(13);
hwint14:
    hwint_slave(14);
hwint15:
    hwint_slave(15);

bad_sys_call:
    movl   $-1,%eax
    jmp     ret_from_sys_call
# eax = function args = {ebx ,ecx,edx}
sys_call:
    cli
    pushl   %ds
    pushl   %es
    pushl   %fs
    pushl   %esi
    pushl   %edi
    pushl   %edx
    pushl   %ecx
    pushl   %ebx

    cmpl    NR_syscalls,%eax
    jae     bad_sys_call

    movl    $KERNEL_DATA,%edx
    movl    %edx,%ds
    movl    %edx,%es
    movl    %edx,%fs

    sti
    call    *sys_call_table(,%eax,4)

ret_from_sys_call:
    popl    %ebx
    popl    %ecx
    popl    %edx
    popl    %edi
    popl    %esi
    popl    %fs
    popl    %es
    popl    %ds
    sti
    iret
