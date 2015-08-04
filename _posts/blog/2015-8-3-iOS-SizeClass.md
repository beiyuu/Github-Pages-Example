---
layout:     post
title:      iOS-SizeClass（1）
category: blog
description: iOS Size Class初探
---

一直很纠结屏幕适配到底是用IB还是用手写代码，前几天看喵神的博客，看到iOS8有大一统适配等字眼，当时心中只有一句话，这好事画面太美，不敢想啊。谁知道今天我真的看到了。开始前咱们先看sizeclass是个什么东东。（本人也是渣渣，所以就用苹果公司的原文了）

Size classes are traits assigned to a user interface element, such as a screen or a view. There are two types of size classes in iOS 8: regular and compact.

上文的大致意思是说什么呐？本人因问烂的一水，就不跟大家拽了。给大家看一下Google翻译吧。

尺寸类是分配给一个用户接口元件的性状，诸如屏幕或图。有两种类型的大小班的iOS中8：定期和紧凑。

不过如果按照我自己的理解，sizeclass是一个被分配给UI控件的特征。这样比较好一点，然而还是很别扭。至于SizeClass我就不敢翻译了。水平真是有限。先不管这个，在看一下句。有这句话我们可以知道在iOS8中SizeClass有两种类型regular和compact。还是不要用翻译了直接英文走起，不要说我装B。因为我不得不装。

不理解理解上面的问题不要紧，咱们看下苹果公司给出的例子，相信大家分分钟钟就能明白这两种类型是怎么回事了。

首先咱们先看下regular这个类型，还是使用苹果给出的例子
<img src="/images/blog/sizeclass/iPad.png">
大家看完之后或许会说为什么都是regular？？？ compact哪？
别急，往下看：
<img src="/images/blog/sizeclass/iPhone.png">

至此SizeClass的初步你就算了解了。官方有许多介绍的文档。大家最好多看看。
