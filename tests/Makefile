# Makefile for all
#
.PHONY:all


# Directories
i = $r/include
s = shell
l = $r/lib


#kernel entry
entry = 0xC00000
#entry = 0x10000
shell_entry = 0xc00000
#shell_entry = 0x1000

all: shell test date

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
#

shell: shell.o $(LIBS)
	$(LD) $< $(LDFLAGS) -e main -lc -Ttext $(shell_entry) -o $@

test: test.o $(LIBS)
	$(LD) $< $(LDFLAGS) -e main -lc -Ttext $(entry) -o $@

date: date.o $(LIBS)
	$(LD) $< $(LDFLAGS) -e main -lc -Ttext $(entry) -o $@
