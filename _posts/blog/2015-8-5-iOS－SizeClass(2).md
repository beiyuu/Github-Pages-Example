---
layout:     post
title:      iOS-SizeClass（2）
category: blog
description: iOS Size Class实战
---

上篇博文我大致更新了一下介绍了SizeClass的一点入门知识，由于作者现在也在一点一点地研究之中，希望大家共同学习一块进步。今天为大家带来的是一个实战内容，不过遇到了一点小小的问题。不过不影响今天的讲解。

现在对上篇blog进行补充一下，看过上篇博客的童鞋可能对any|any提出疑问，这是一种什么类型哪。其实大家仔细想一下应该能推出这个是什么意思？没错就是对所有的类型都有效，即你现在的布局约束在所有的设备上都有效。往往情况下这个是很难实现的，想象一下，你相对于iPad宽度设置的约束在5S上会成为什么样子。不过也有特殊的情况，最简单，我设置显示的TxextView全屏显示。其实在any|any下实现所有布局还是有可能的，这个问题我们留到下一篇去讨论。

开始今天的主题，首先自觉创建一个SingleViewAppication，不需要任何设置，首先咱们5～6P进行适配，首先是竖屏，有上篇的博客我可以知道竖屏的SizeClass类型是R/C，那么我们调整SizeClass如下图所示：

<img src="/images/blog/sizeclass/rc.png">

接下来就是一个简单的布局如图所示

竖屏
<img src="/images/blog/sizeclass/shu.png">

横屏
<img src="/images/blog/sizeclass/heng.png">

iPad
<img src="/images/blog/sizeclass/iPad1.png">

运行都是在模拟器进行，自己动手试试吧。很简单！