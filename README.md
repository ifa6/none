%none操作系统用户手册
%罗忠尧
% Wed Apr 16 22:00:50 CST 2014

[源码]: https://github.com/TaiChiForLuoZhongYao/none
[none]: https://github.com/TaiChiForLuoZhongYao/none
[GITHUB]: https://github.com/TaiChiForLuoZhongYao/none
[lzy]: mail:LuoZhongYao@gmail.com

*   [概述](#overview)
    *   [什么是none](#what-is-fuck)
    *   [当前none是什么样子](#schedule)
    *   [之前none家族是什么样子](#beforo)
    *   [了解更多](#learn-more)
    *   [关于这份文档](#about-this)
*   [马上开始](#now-start)
    *   [准备](#prepare)
    *   [运行](#run)
*   [编译none](#compile)
    *   [下载源码](#download)
    *   [源码结构](#source-structure)
    *   [编译环境](#env)
    *   [编译选项](#compile-option)
*   [运行none](#run)
    *   [虚拟机](#bochs)
    *   [物理机](#pc)
*   [更新记录](#wiki)
    *   [使用GCC.4.9](#gcc) 
    *   [none针对GCC4.9的更改](#for-gcc4.9)
    *   [常规更新](#normal-update)
*   [近期计划](#target)

<h2 id="overview">概述</h2>
![None新特性预览](http://r.photo.store.qq.com/psb?/2f055629-26d1-450a-b719-0c9a5862abb4/8f5clD6S9VIPUSTIu8Oa52PZh58NjPIIgMlTow0Hi6A!/o/dMaLGsdKEAAA&bo=oAWEA6AFhAMCACQ!&t=5&rf=viewer_311)
<h3 id="what-is-fuck">什么是none</h3>
[none][]是[lzy][]编写的,一个微内核,不兼容POSIX,不可工作的实验性质的操作系统,项目开源,并且[lzy][]希望它是自由的.编写目的是**just for fun**.编写的最初目的是因为[lzy][]初次接触**GNU/Linux**的时候,觉得**GNU/Linux**太复杂了,我的参考目标是**MS-DOS**.**MS-DOS**只需要`io.sys`,`command.com`两个文件即可跑起来,然后根据需要自己添加需要的程序.整个系统都在掌控之中.而**GNU/Linux**,一装上就几百个目录,几千个文件,看起来十分复杂.于是萌生了写一个**MS-DOS**一样简洁(看起来简洁),**GNU/Linux**一样强大的操作系统.项目几经波折,数次重写,数次更名,两次更换托管方式,却都因本人水平太菜,进展缓慢,[none][]的编写过程就是本人学习的过程.如今,[none][]看起来像是一个内核了,可以执行程序,读写文件,打印图像.[none][]当前托管在[GITHUB][].
<h3 id="schedule">当前none是什么样子</h3>
*  使用grub引导
    * [none][]使用grub作为引导,这样省去了引导,进入保护模式,获取内存map等繁琐的工作(之前版本这部分都是自己做的)
*  多进程(多对象)
    * [none][]支持`fork`方式创建进程.进程是以对象的方式实现的(当时我是单身).
*  进程间通信(对象调用其他对象的方法)
    * 进程间的IPC是直接调其他对象的方法,每个对象都有一个固定数目的外部方法,该方法集首先重父进程(父对象)那里继承过来,对象可以修改默认的方法.
*  虚拟内存管理
    * 实现了简单的虚拟内存管理,这部分问题比较多,而且对实现放松也不满意,但其他模块严重依赖这个模块,导致其他模块停止不前.
*  文件系统
    * 当前的文件系统是Minix 2,因为这个文件系统简单,同时又强大.文件系统的活动部分,现在很简单,只是刚好能运行.这部分也是需要重点修改的
*  C库
    * 非常非常非常非常简单,以致于都不能称为库.
*  最小的bash
    * bash的实现被提前,我同事**YangYongHai-x**认为一个系统有了一个bash之后,编写才会更有动力,于是他动手写了一个.
*  几个演示程序
    * test,ascii等几个演示程序,这几个演示程序源码在`tests/`目录下

<h3 id="befora">之前none家族是什么样子</h3>

[none][]家族第一代是一个引导程序(MBR),只有512字节.仅仅像屏幕打印"Hello world",在[CSDN论坛的fdisksys](http://bbs.csdn.net/topics/340013748)能见到后来改进的版本.
第二代MBR引导固定地址的二进制文件,实现了简单的多进程,没有实现bash.第三代实现了NE2K网卡驱动,实现了ARP,IP,UDP协议(**非常非常非常精简版**),使用ARP欺骗了路由器,使用UDP实现了两台局域网主机(物理主机Ubuntu,虚拟主机XP,虚拟主机none)之间的通信(*打印Hello world*).第一代代码丢失,第二代代码在[Google Code](https://code.google.com/p/osgml/),[第三代](https://code.google.com/p/gml-vm/)也在Googe Code.

<h3 id="learn-more">了解更多</h3>

想了解更多,请联系[lzy][].

<h3 id="about-this">关于这份文档</h3>

这份文档使用`markdown`编写,编译工具是`pandoc`,文档的源码可通过[](https://naiz.biz/none/user-manual.md)下载.

<h2 id='now-start'>马上开始</h2>

<h3 id='prepare'>准备</h3>
运行none需要bochs,近期提供其他虚拟机的镜像,和使用方法.
Ubuntu下bochs的安装

```bash
sudo apt-get install bochs
```
Fedora下面安装

```bash
sudo yum install bochs
```

通过git获取none
```bash
git clone https://github.com/TaiChiForLuoZhongYao/none.git
```

<h3 id='run'>运行</h3>
`a.img` `n.hd`是已经编译好的的启动镜像和AT硬盘镜像,直接可以在bochs下运行.安装好bochs后使用如下命令即可运行
```bash
bochs
```

<h2 id="compile">编译none</h2>

<h3 id="download">下载源码</h3>

下载[源码][]简单.使用执行下面命令即可(git的安装,请自行Google):

```bash
$ git clone https://github.com/TaiChiForLuoZhongYao/none.git
```
<h3 id="source-structure">源码结构</h3>

```bash
c/
fs/
include/
kernel/
lib/
mm/
mnt/
tests/
tools/
objs/
Makefile
n.hd
a.img
bochsrc
bochsrc.bxrc
none.bmp
README.md
```
*   `bochsrc.bxrc` `bochsrc` 是bochs的配置文件,`bochsrc.bxrc`是为了照顾使用*windows*的朋友.
*   `n.hd` 是虚拟的AT硬盘,*minix 2文件系统*,里面的内容可参考`Makefile`文件挂载后查看,`tests/`下编译生成的文件都放在该文件里面.
*   `a.img` 是虚拟软盘镜像,里面已经安装了`grub`,`kernel`目录下生成的内核`none`文件就放在该文件里面.
*   `Makefile`编译管理文件.
*   `include/`目录,全局头文件目录.
*   `c/`目录,C库源码目录
*   `fs/`,`mm/`,`kernel/`,分别是,文件系统,内存管理,内核模块的源文件目录
*   `objs/`,编译输出文件

<h3 id="env">编译环境</h3>

编译[none][]需要Linux环境,GCC编译器需要4.9版本.

<h3 id="compile-option">编译选项</h3>

```bash
$ make  # 编译生成none
$ sudo make go # 将生成的none安装到a.img,将tests/下面的程序,安装到n.hd,并启动bochs运行
$ sudo make install #将`a.img`,`n.hd`挂载到`mnt/boot/`,`mnt/hw/`目录下
$ sudo make uninstall #`mnt/boot/`,`mnt/hw/`的卸载
```
<h3 id="bochs">虚拟机</h3>

[none][]因为使用了AT硬盘,而这种硬盘已经绝种了,所以必须使用虚拟机运行,(将来会实现ramdisk,这样就可以在物理机上运行),而只有`bochs`的虚拟硬盘是*FAST模式*,可以直接挂载Linux下进行操作,十分简单,所以理想的运行环境是`bochs`.
bochs需要特殊编译.可参考本人的另一篇文章[编译支持VESA3的bochs](http://www.cnblogs.com/-lzy/p/3486142.html)
<h3 id="pc">物理机</h3>

因为外部程序,bash都放在外部硬盘,而文件系统当前使用的minix2文件系统是建立在AT硬盘之上,所以当前OS还无法在物理机上运行,我将近快将AT硬盘替换成ramdisk设备,这样将可在物理机上运行[none][]

<h2 id="wiki">更新记录</h2>
<h3 id="gcc">使用GCC4.9</h3>

GCC4.9在4.23发布了,这次更新C语言方面提供了如下特性:

*   更人性化,更可读的错误报告,fedora源里面的gcc4.8已经支持这个.
*   C11 `_Generic`关键字的支持,本次更新我最爱的一个特性
*   `_auto_type`关键字的支持,这个跟\_\_typeof\_\_功能有重叠.也许它更好吧
其他特性请到[GCC官网](http://gcc.gnu.org)查看.我期望以后编译器的设计者将更多在编译时编译器的很多特性像语言开放,这样我们就能写出更多灵活,简短的代码.比如\_\typeos\_\_,\_Generic等就是很好的例子.

<h3 id="for-gcc4.9">none针对GCC4.9的更改</h3>

GCC4.9的发布无疑是今年最大的惊喜,我希望我的操作系统成为前沿的跟上时代的,我不会为了兼容性,移植性,而舍弃C语言,开发工具更简便强大的特性抱着古老的标准不放.阻碍新技术的普及.C语言发展这么多年,标准不断更新,但大部分程序依然使用古老的C89,ANSI C编写,这方面的例子有[VIM](http://vim.org),[mixin](http://minix3.org)甚至,Minix还在使用AT&T风格的C语言.为此,GCC4.9的发布,none没有道理不使用,为了使用GCC4.9,none进行了如下修改:

*   `asm`关键字使用`__asm__`代替,因为`asm`在GCC4.9的-std=c11下不可用
*   利用C99的匿名结构体,字段赋值将run宏改写,现在能这么使用run,`run(PID,READ,.offset = offset,.count = count,.ptr = ptr)`,`run(PID,CLOSE)`,`run(PID,EXEC,.name = "/bin/sh")`,该用法灵感来源于[C技巧：结构体参数转成不定参数](http://coolbash.cn/articles/2801.html)
*   目前没有使用`_Generic`,关键字,但将在合适的时机大量使用,已经使用`__auto_type`关键字
*   使用了我的一个个人C语言语法扩充库[z.h](https://github.com/TaiChiForLuoZhongYao/lambda),该库还不稳定,但很方便.我将继续维护这个库,并用于none

<h3 id="normal-update">常规更新</h3>

*   Object添加firend数组,用来支持重定向,调用0 ~ NR\_FIREND之间的对象将通过firend转换后发送,中断除外,中断不支持重定向,否则系统错误,并且缺乏安全
*   ELF文件的加载已经完善,修复minix2文件系统的一个BUG

<h2 id="target">近期计划</h2>

*   实现管道,bash参数传递
*   通过串口调试生命游戏`tests/life.c`
