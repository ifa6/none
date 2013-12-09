#ifndef __AT_H__
#define __AT_H__

/* Task File Registers (LBA) */
#define AT_DATA     0x1f0
#define AT_ERROR    0x1f1
#define AT_FEATURES 0x1f1
#define AT_SECTOR_COUNT    0x1f2
#define AT_LBA_LOW  0x1f3
#define AT_LBA_MID  0x1f4
#define AT_LBA_HIGH 0x1f5
#define AT_DEVICE   0x1f6
#define AT_STATUS   0x1f7
#define AT_COMMAND  0x1f7

/* Control  Registers   */
#define AT_ALSTATUS 0x3f6
#define AT_DEVICE_CTL   0x3f6
#define AT_DEVICE_ADDRESS   0x3f7

/* IDE Erroe Register */
#define ATE_AMNF     1
#define ATE_TK0NF    2
#define ATE_ABRT     4
#define ATE_MAC      8
#define ATE_IDNF     0x10
#define ATE_MC       0x20
#define ATE_UNC      0x40
#define ATE_BBK      0x80

/* IDE  Device Register (LBA) */

/* IDE Status Register */
#define ATS_ERR         1
#define ATS_INDEX       2
#define ATS_ECC         4
#define ATS_DRQ         8
#define ATS_SEEK     0x10
#define ATS_WRERR    0x20
#define ATS_READY    0x40
#define ATS_BUSY     0x80

/* IDE Command */
#define AT_READ     0x20    
#define AT_WRITE    0x30
#define AT_CHECK    0x90

/*  Device Register */
#define AT_SLAVE    0x10

/* Device Contrl Register */
#define AT_RESET    0x0c


#endif
