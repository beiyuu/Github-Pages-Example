---
layout: post
title: 重装linux mint 17没有stdio.h
category: project
description: 今天重装了我的mint,其实我就是受不了kde的桌面乐,真实够了.
---
系统配置:linux mint 17.2 gcc 4.8.2
    今天重装了一下我的linux mint,原因我也说明了.真实坑,其他我不想说耍啥了.黑一下kde桌面,真实反人类啊,不解释.
    今天刚刚做好,看到这是gnome桌面,心里顿时好受多了.赶紧试试了我原来的配置有没有问题.试试了,感觉还挺好,习惯性的来了个helloworld,却提示stdio没有.啥情况,然后习惯性的打开了bing(梯子坏了,先用着吧)我感觉应该是gcc的问题.谁知道网上答案还挺多,于是找到了一个比较靠谱的.亲测没问题
    gcc 4.8.2由于不知名原因缺少libc6-dev这个框架,解决方法很简单.首先跟新一下的源,最好改成中国的源,我是没有该就成功了.不过在后来安装一些软件的时候我还是改了,因为安装软件真是慢.然后更新源,直接用apt安装就可以了.具体命令如下:
    sudo apt-get update
    sudo apt-get install libc6-dev
