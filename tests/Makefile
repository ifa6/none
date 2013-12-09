#
#	样板Makefile文件,集体项目根据实际情况进行简单修改即可
#	Author : lzy
.PHONY:all clean
#当前目录
LOCAL_PATH=$(notdir $(shell pwd))
CFILES=$(shell find ./ -maxdepth 1 -name "*.c")
SFILES=$(shell find ./ -maxdepth 1 -name "*.S")
sFILES=$(shell find ./ -maxdepth 1 -name "*.s")

# LIBS 
LS = c

entry = 0xc00000
# .o文件集
#
OBJS=$(CFILES:%.c=%.o) $(SFILES:%.S=%.o) $(sFILES:%.s=%.o)
LIBS += $(addprefix lib,$(addsuffix .a,$(LS)))
LDFLAGS += $(addprefix -l,$(LS)) -e main -Ttext $(entry)
objs = $(basename $(OBJS))
#OBJS = $(addsuffix .o,$(objs))
all:$(objs) $(LIBS)

clean:
	@-rm -f *.[od] $(objs)
include $r/tools/Makefile.rule
-include $(OBJS:%.o=%.d)

$(objs): $(OBJS) $(LIBS)
	for exe in $(objs);do\
		$(LD) $$exe.o $(LDFLAGS) -o $$exe||exit 1;\
	done

#shell: shell.o $(LIBS)
#	$(LD) $< $(LDFLAGS) -o $@
#
#test: test.o $(LIBS)
#	$(LD) $< $(LDFLAGS) -o $@
#
#date: date.o $(LIBS)
#	$(LD) $< $(LDFLAGS) -o $@
#
#ascii: ascii.o $(LIBS)
#	$(LD) $< $(LDFLAGS) -o $@
#
#rascal: rascal.o $(LIBS)
#	$(LD) $< $(LDFLAGS) -o $@
#	
#ls: ls.o $(LIBS)
#	$(LD) $< $(LDFLAGS) -o $@
#
#cat: cat.o $(LIBS)
#	$(LD) $< $(LDFLAGS) -o $@
#
#vim: vim.o $(LIBS)
#	$(LD) $< $(LDFLAGS) -o $@
