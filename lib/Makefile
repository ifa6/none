# Makefile for all
#
.PHONY:clear install make

# Directories
i = $r/include
l = libc.a
vpath %.h $r/include/

# Programs, flags, etc.
AS = as
CC = gcc
LD = ld

ASFLAGS = --32
CFLAGS = -I $i -m32 -c -std=gnu99 -fno-stack-protector -Wall -nostdinc
LDFLAGS = -m elf_i386 -Ttext 0x300000

OBJS = vsprintf.o string.o  malloc.o
# What to make.
#

$l:$(OBJS)
	$(AR) -r $@ $^

%.o:%.S
	$(CC) $< -o $@ $(CFLAGS)

%.o:%.c
	$(CC) $< -o $@ $(CFLAGS) 

%.o:%.s
	$(AS) $< -o $@ $(ASFLAGS)


clear:
	-rm *.o -rf
