---
layout: post
title: 获取滑动手势的划过的距离
description: 最近刚刚参加工作，比起以前进步还是有的。今天记录一下开发中用到的获取滑动手势划过距离的方法
category: blog
---

说起今天我写的，这是一个非常简单的例子，为了感召现在的潮流，今天的demo，我决定用swift演示
好，直接是上代码：
        //Create a gestrue
        let pan = UIPanGestureRecognizer(target: self, action: "handler:")
        //Add gestrue into view
        self.view.addGestureRecognizer(pan)

        func handler(getsture: UIPanGestureRecognizer){
        //这个时候我们获取的是移动的点，而不是直接的距离，如果想得到移动距离，需要通过点对点的距离公式去计算
        let translation = getsture.translationInView(view)
        //我们打印y的坐标，就可以得到y方向移动的距离，又因为坐标系的不通，我们在前面加-修正
        let distance = -translation.y
        print(distance)
    }

这些代码还是比较简单的，不过运用的好，你可以在你的项目中完成很多比较牛b的功能。好了，今天大致就这些。最近我正在研究底层的东西，如果能研究出来点成绩，我也会第一时间分享给大家