---
layout: post
title: UILabel 自动换行
description: 在网上找的，然后发现有很多人说有显示不完全的情况，昨天从北京自己回来，在火车没事调试了一下，发现了点什么。
category: blog
---
今天的主题就是UILable实现自动换行，其实也不是什么高大上的技术，而且我本人对这个的实现机制不是很懂，至于原理方面带我再多加研究，到时候在分析给大家听。

直接上代码

	self.view.backgroundColor = [UIColor whiteColor];
    NSString *str = @"为什么会失败那，感觉挺对啊，谁能告诉我这是为啥, 只要足够长，他还是能够换的，感觉好玄幻啊";
    CGSize vsize = [str sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(vwidth, 10000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    
    self.view.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, vsize.width, vsize.height/5)];
    label.center = self.view.center;
    label.numberOfLines = 0;
    label.text = str;
    
 特别说明一下：
 	有很多人反映这个方法可能显示不完全，经过调试我发现，UILabel的text字体大小是有默认值的，如果大小不设置的话，必须和默认值一样，否则就会出现显示不完全的情况。
