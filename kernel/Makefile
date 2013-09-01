# Makefile for all
#
.PHONY:all


# Directories
i = $r/include
s = none
l = $r/lib

all:$s

#kernel entry
entry = 0x305000

# Programs, flags, etc.

sources = main.c\
		  clock.c\
		  at.c\
		  console.c\
		  mm.c\
		  object.c\
		  panic.c\
		  printk.c\
		  system.c\
		  task.c\
		  trap.c\
		  keyboard.c\
		  buffer.c\

ssources = x86.s

Ssources = setup.S

LIBS = $l/libc.a $l/libfs.a $l/libmm.a


include	$r/tools/Makefile

co = $(sources:.c=.o)

so = $(ssources:.s=.o)

So = $(Ssources:.S=.o)

OBJS = $(So) $(so) $(co)

LDLIB = -lc -lfs -lmm


# What to make.
#

$s:$(OBJS) $(LIBS) 
	$(LD) $(OBJS) $(LDFLAGS) -Ttext $(entry) $(LDLIB) -o $@
