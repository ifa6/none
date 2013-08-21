# Makefile for all
#
.PHONY:all


# Directories
i = $r/include
s = hello
l = $r/lib

all:$s

#kernel entry
entry = 0x1000

# Programs, flags, etc.

sources = main.c\

LIBS = $l/libc.a


include	$r/tools/Makefile

co = $(sources:.c=.o)

so = $(ssources:.s=.o)

So = $(Ssources:.S=.o)

OBJS = $(So) $(so) $(co)

# What to make.
#

$s:$(OBJS) $(LIBS) 
	$(LD) $(OBJS) $(LDFLAGS) -e main -lc -Ttext $(entry) -o $@
