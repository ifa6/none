# Makefile for all
#
.PHONY:clear install make all

# Directories
i = $r/include
s = none
l = $r/lib
m = $r/mm

#kernel entry
entry = 0x305000
vpath %.h $r/include/

# Programs, flags, etc.
AS = as
CC = gcc
LD = ld

ASFLAGS = --32
CFLAGS = -I $i -m32 -c -std=gnu99 -nostdinc -fno-stack-protector -Wall
LDFLAGS = -m elf_i386 -Ttext $(entry) -nostdlib \
		  -L $l -lc #--oformat binary

HEAD = stdio.h malloc.h stddef.h stdarg.h

OBJS = setup.o main.o console.o printk.o panic.o x86.o trap.o proc.o\
	   mm.o\
	   clock.o

LIBS = $l/libc.a 
# What to make.
#
$s:$(OBJS) $(LIBS)
	$(LD) $(OBJS) -o $@ $(LDFLAGS)

%.o:%.S
	$(CC) $< -o $@ $(CFLAGS)

%.o:%.c 
	$(CC) $< -o $@ $(CFLAGS)

%.o:%.s
	$(AS) $< -o $@ $(ASFLAGS)

clear:
	-rm *.o -rf
