---
layout: post
title: OS X 10.11 安装cocoapods
description: OS X更新之后，各种坑，今天咱们聊聊cocoapods
category: blog
---
给出这个题目的时候，我想了一下啊。好像是OS X 11跟新完之后才出现了这个问题。不顾现在我已经不想再理会这个东西。因为今天我已经受够了这个东东。

今天搞高德地图API的调用，发现我的pod命令无法使用了。然后细细研究发现的/usr/local/bin已经没有了pod，然而在我的gem list还可以找到cocoapods的安装文件。

我的天，什么鬼这是。于是开始了今天的神坑一小时。在这里我就不再给大家赘述了。

首先跟跟新用户说下cocoapods安装方法，现在cocoapods的安装方法很简单。自从苹果公司给出规范化的插件管理系统，安装插件已经成为一件很简单的事情。
打开Xcode->Window->Package Manager打开之后搜有cocoapods，最后点击install，因为太简单了，我就不在坠图了。然后点击product就可以找到你刚才暗转的cocoapods
。然而有些人点击运行的时候却发现会错，我表示这个不知道为什么。不过作者我为大家找到了一个解决方案。这是<a href="http://www.cocoachina.com/bbs/read.php?tid-326236-fpage-4.html">链接</a>

然而还是有些人的问题还是解决不了，然而你去网上搜索答案的时候又是各种版本，我在这里亲测一个。

首先更新Gem： sudo gem update --system -n /usr/local/bin
安装: sudo gem install -n /usr/local/bin cocoapods

亲测上面的方法的棒棒的。至于什么原因。因为作者买的vpn被大天朝给封了，所以具体的原因大家就自己Google吧