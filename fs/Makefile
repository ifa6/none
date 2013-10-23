#
#	样板Makefile文件,集体项目根据实际情况进行简单修改即可
#	Author : lzy
.PHONY:all clean
#当前目录
LOCAL_PATH=$(notdir $(shell pwd))
CFILES=$(shell find ./ -maxdepth 1 -name "*.c")
SFILES=$(shell find ./ -maxdepth 1 -name "*.S")
sFILES=$(shell find ./ -maxdepth 1 -name "*.s")

# .o文件集
OBJS=$(CFILES:%.c=%.o) $(SFILES:%.S=%.o) $(sFILES:%.s=%.o)
obj=$r/lib/lib$(LOCAL_PATH).a
all:$(obj)

$(obj):$(OBJS)
	ar -r $@ $^ 
clean:
	@-rm -f *.[od]
include $r/tools/Makefile.rule
-include $(OBJS:%.o=%.d)
