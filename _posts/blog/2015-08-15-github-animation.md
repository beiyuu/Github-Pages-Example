---
layout: post
title: Core Animation 初步
description: 总觉得项目里用的动画很高大上
category: blog
---
以下的属性介绍来源于我读过的博客和官方给出的说法。首先跟大家强调一下并不是所有的动画都是直接作用在UIView上，而是作用在另一动画基础组成部分CALayer上。开篇我们首先介绍一下CALayer。

CALayer类是用来管理图像基础的内容并且允许你在这些内容上执行动画。这些层经常用来提供一些视图的备份，当然他也可以独立创建。一图层的主要作用来管理你提供的可见内容但是它本身也有一些可以设置的可见属性，比如说背景颜色，边框还有阴影（作者一直想知道这个怎么做。除了管理可见内容以外，图层也可以维护屏幕上展示内容的几何参数，比如说位置，大小，还有变换。初始化动画的图层内容或者几何形状时，只需要改变他的图层参数就行了。另外一个图层类还封装了一个写时间参数，这个是通过代理模式实现的。如果是一个试图的图层，你不用设置他的代理，因为是自动，至于你自己创建的你需要自己手动设置。（内容来源于官方文档，作者自己翻译，欢迎勘误）还想大家推荐一篇[blog],比我这篇写的要深刻的多，而且写的挺好的。大家可以读读。他写了一个系类的动画博客，都值得一度。

虽然上面这个blog例子已经和好了。不过在这里我想给大家演示一下这里没有的内容。OK，开始今天的代码。

<code>
	self.containView.layer.backgroundColor = [UIColor redColor].CGColor;
    //大家都知道layer是有位图位图构成的，而实现是有Quartz 2D（在iOS中）完成的，在Quartz中一般CGColor设置背景颜色和透明程度
    
    self.containView.layer.cornerRadius = 20.0; //设置圆角，这个你自己体验下效果啊就行了
    self.containView.layer.shadowOpacity = 0.8;//阴影透明度
    self.containView.layer.shadowOffset = CGSizeMake(10.0, 10.0);
    self.containView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.containView.layer.borderColor = [UIColor blueColor].CGColor;
    self.containView.layer.borderWidth = 2;//这个运行的效果图你在blog中也能看到，我就不给大家贴出了。
    
    //下面我们添加一个Sublayer到containView.layer中去。
    CALayer *subLayer = [CALayer layer];
    subLayer.backgroundColor = [UIColor blueColor].CGColor;
    subLayer.frame = CGRectMake(0, 0, 80, 80);
    subLayer.anchorPoint = CGPointMake(0.5, 0.5);
    subLayer.position = CGPointMake(100, 100);
    [_containView.layer addSublayer:subLayer];
    //看了这个之后，细心呢的同学会发现，sublayer的在视图上的位置到底是怎么确定的？这个留着我下篇blog为大家娓娓道来。
</code>

说完了这些之后再跟大家总结一下，重要就是layer不能单独提供任何可视内容，必须依托于view。再者layer不参与任何事流的处理过程。仅仅（当用户触摸一个按钮时，会触发按钮相关的一系列事件）。我觉得这个才是view和layer质的区别。大家一定要记住。另外就像推荐blog中作者说的那样，layer的处理方式是将其转化为位图，通过采用cache技术，所以他对资源的开销较少。这个也是我们为什么执行动画时用他的原因。



[blog]: http://blog.csdn.net/hello_hwc/article/details/42580773 "blog"