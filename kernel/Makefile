#
#	样板Makefile文件,集体项目根据实际情况进行简单修改即可
#	Author : lzy
.PHONY:all clean
#当前目录
LOCAL_PATH=$(notdir $(shell pwd))
CFILES=$(shell find ./ -maxdepth 1 -name "*.c")
#setup必须在前面编译,这个是grub规定的
SFILES=$(shell find ./ -maxdepth 1 -name "*.S" | sort)
sFILES=$(shell find ./ -maxdepth 1 -name "*.s")

# LIBS 
LS = c fs mm

entry = 0x305000
# .o文件集
#
OBJS=$(SFILES:%.S=%.o) $(CFILES:%.c=%.o) $(sFILES:%.s=%.o)
LIBS += $(addprefix lib,$(addsuffix .a,$(LS)))
LDFLAGS += $(addprefix -l,$(LS))
obj = none
all:$(obj)

$(obj):$(OBJS) $(LIBS)
	$(LD) $(OBJS) $(LDFLAGS) -Ttext $(entry) -o $@

clean:
	@-rm -f *.[od] none
include $r/tools/Makefile.rule
-include $(OBJS:%.o=%.d)
