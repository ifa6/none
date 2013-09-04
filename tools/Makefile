#
#
#	项目编译规则文件，其他目录引用该文件的规则来编译。这种用法来自BlueLab。
#	一个把消息机制用得非常烂的蓝牙开发平台。
.PHONY: clean
i = $r/include
l = $r/lib

vpath %.h $r/include/

AS = as
AR = ar
CC = gcc
LD = ld

ASFLAGS = --32
CFLAGS = -I $i -m32 -std=gnu99 -nostdinc -fno-stack-protector -fno-builtin -Wall -Werror
LDFLAGS = -m elf_i386 -L $l -nostdlib

%.a:$(source:.c=.o)
	@$(AR) -r $@ $^

# 调用了C预处理的汇编文件 
%.o:%.S	
	@$(CC) $< -o $@ $(CFLAGS) -c

#  很好用但是不标准的C编译，Cygwin下的GCC编译通不过。Fuck！
%.o:%.c
	@$(CC) $< -o $@ $(CFLAGS) -c

%.o:%.s
	@$(AS) $< -o $@ $(ASFLAGS) -c

%.d:%.c
	@$(CC) $< $(CFLAGS) -M -o $@.$$$$;\
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

sinclude $(sources:.c=.d)

clean:
	@-rm *.o -f
	@-rm *.d -f
	@for file in $(CLEAN_FILES);do\
		rm -f $$file;\
	done
