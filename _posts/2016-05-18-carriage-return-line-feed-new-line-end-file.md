---
layout: post
title: 回车、换行、和文件末尾空行
description: 回车和换行在不同系统下面定义不同，时不时会有一些小问题出来，git 经常出现的 No new line at the end of file 也让很多人费解，需要梳理一下
category: blog
---

## 回车和换行

回车 (Carriage Return) 和换行 (Line Feed) 的区别，[这里](http://stackoverflow.com/questions/1761051/difference-between-n-and-r)有一个历史原因可参考：

> 在计算机还没有出现之前，有一种叫做电传打字机（Teletype Model 33）的玩意，每秒钟可以打10个字符。但是它有一个问题，就是打完一行换行的时候，要用去0.2秒，正好可以打两个字符。要是在这0.2秒里面，又有新的字符传过来，那么这个字符将丢失。

> 于是，研制人员想了个办法解决这个问题，就是在每行后面加两个表示结束的字符。一个叫做"回车"，告诉打字机把打印头定位在左边界；另一个叫做"换行"，告诉打字机把纸向下移一行。

发明计算机时，这个概念被沿用下来，但因为条件的限制和设计者的喜好，有了一些分歧：

- Unix 系统里，每行结尾只有"<换行>"，即"\n"
- Windows 系统里面，每行结尾是"<回车><换行>"，即"\r\n"
- 在老的 Mac 系统里，每行结尾是"<回车>"，即"\r"

我们来验证一下，我在 Windows 下用记事本新建一个文本文件，它的二进制编码如下：

    //源文件内容
    hello
    hello2

    //二进制内容
    0000000: 6865 6c6c 6f0d 0a68 656c 6c6f 32         hello..hello2

同样在 Mac 下用 Vim 新建一个：

    //源文件内容
    hello
    hello2

    //二进制内容
    0000000: 6865 6c6c 6f0a 6865 6c6c 6f32 0a         hello.hello2.

`0a`是 LF 的 ASCII 编码, `0d`是 CR 的 ASCII 编码。区别很明显了

- Mac 下的文本文件在 Windows 下打开会成为一行，因为 Windows 只认识`\r\n`，也就是`0d0a`
- Windows 下的文本文件在 Mac 下打开，Vim 中会在每行末尾显示一个 `^M`，(不是两个字符组成的)

## 文件末尾空行

[POSIX](https://zh.wikipedia.org/zh-sg/POSIX)对行的[定义](http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_206)如下：

  > 3.206 Line

  > A sequence of zero or more non- <newline\> characters plus a terminating <newline\> character.

  > 行是由0个或者多个非 "换行" 符的字符组成，并且以 "换行" 符结尾。

这样做有什么好处呢，举个例子：

    //hello.c
    #include head.h
    print('hello')

    //world.c
    #include tail.h
    print('hello')

如果这两个文件都按 POSIX 规范来写， 在`cat *.c`之后，是没有问题的：

    //cat.c

    #include head.h
    print('hello')
    #include tail.h
    print('hello')

如果缺少最后一行的换行符（如 Windows 文件那样的定义），`cat`之后，就有问题了：

    //error.c

    #include head.h
    print('hello')#include tail.h
    print('hello')

所以，从这点去理解 POSIX 对行的定义，非常合理，对于任意文件的拼接，也各自保持了文件的完整性。

不遵守标准带来的则是：在一些编辑器下面，比如 Sublime，他把`\n`的当做了行之间的分隔符，于是文件最后一行的`\n`就看上去成了一个新的空行，这就是错误解读标准造成的，拼接文件时也会产生不必要的麻烦，比如上例。

## \ No new line at end of file

基于上面的原因，再去看 git diff 的`\ No new line at end of file`信息，就很好解释了。

各编辑器对于换行符的理解偏差，导致的文件确实发生了变化，多了或少了最后的`0a`，那么对于 diff 程序来说，这当然是不可忽略的，但因为`0a`是不可见字符，并且是长久以来的历史原因，所以 diff 程序有个专门的标记来说明这个变化，就是：

`\ No new line at end of file`

各编辑器也有相应的办法去解决这个问题，比如 Sublime，在`Default/Preferences.sublime-settings`中设置：

    // Set to true to ensure the last line of the file ends in a newline
    // character when saving
    "ensure_newline_at_eof_on_save": true,

所以，请遵守规范。

[BeiYuu]:    http://beiyuu.com  "BeiYuu"
