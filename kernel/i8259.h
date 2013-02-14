#ifndef __I8259_H__
#define __I8259_H__

#define INT_CTL         0x20    /* 主8259A 命令端口 */
#define INT_CTLMASK     0x21    /* 主8259A中断掩码端口 */
#define INT2_CTL        0xa0
#define INT2_CTLMASK    0xa1

#define IRQ0_VECTOR     0x20
#define IRQ8_VECTOR     (IRQ0_VECTOR + 8)

#define CASCADE_IRQ     2

#endif
