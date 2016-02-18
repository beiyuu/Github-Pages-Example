---
layout: post
title: ApplePay原理
category: opinion
description: ApplePay移动支付
---
2016-02-18 ApplePay中国正式上线，那其原理是什么呢？  
抓取ApplePay的交易log发现其走的是闪付(QuickPass即qPBOC)的联机流程,ApplePay在中国确实比较特殊，竟然内置了eSE，这使得ApplePay使用起来与一张卡的体验几乎没有太大差别，
在交易的时候改需要输入联机密码了，还是要输入的，不过交易时不需要手机联网。期待银行推行小额免密功能。  
