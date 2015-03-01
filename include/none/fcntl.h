#ifndef __NONE_FCNTL_H__
#define __NONE_FCNTL_H__

#include <none/if.h>

/* file interface */
#define FIF_OPEN         IF_OPEN
#define FIF_CLOSE        IF_CLOSE
#define FIF_DELETE       IF_DELETE
#define FIF_READ         IF_READ
#define FIF_WRITE        IF_WRITE
#define FIF_READPAGE     IF_READPAGE
#define FIF_WRITEPAGE    IF_WRITEPAGE
#define FIF_IOCTL        IF_IOCTL
#define FIF_SEEK         IF_SEEK
#define FIF_MOUNT        IF_MOUNT
#define FIF_UMOUNT       IF_UMOUNT
#define FIF_REMOUNT      IF_REMOUNT
#define FIF_MKDIR        IF_USER1
#define FIF_RMDIR        IF_USER2


/* When introducing new O_* bits */
#define O_ACCMODE   00000003
#define O_RDONLY    00000000
#define O_WRONLY    00000001
#define O_RDWR      00000002
#define O_CREAT     00000100
#define O_EXCL      00000200
#define O_NOCTTY    00000400
#define O_TRUNC     00001000
#define O_APPEND    00002000
#define O_NONBLOCK  00004000
#define O_DSYNC     00010000
#define O_FASYNC    00020000
#define O_DIRECT    00040000
#define O_LATGEFILE 00100000
#define O_DIRECTORY 00200000
#define O_NOFOLLOW  00400000
#define O_NOATIME   01000000
#define O_CLOEXEC   02000000
#endif
