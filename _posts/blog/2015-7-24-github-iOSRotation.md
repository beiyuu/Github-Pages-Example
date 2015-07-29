---
layout:     post
title:      iOS - Rotation
category: blog
description: 当苹果公司引入大一统概念之后，灭掉了关于屏幕旋转的一群小伙伴，仅以此篇文章悼念小伙伴，欢迎新伙伴
---
今天上午修改一个第三方框架，心理现在只剩下一句话，我日了个狗啊，为什么这么说那，此话要从今年的苹果开发者大会说起，说起来我个人也不知道为什么，苹果为了贯彻自己我认为好你就要接受的原则（多数时候确实是这样），又推出几个设计理念。对于其他的我在这里先不说，毕竟水平有限，没有用过，不敢多说，我今天就来说一下关于旋转的几个变化。

如果你的app用到了关于旋转方面的知识，你应该已经发现。原本好好的代码，更新过iOS8之后，突然多了好多黄色的感叹号（最近看见这个我tm就想死），心理或许纳闷，什么情况这是。如果你看了今年的苹果开发者大会或许就知道怎么回事。苹果对于屏幕旋转提出了全新的解决方法，虽然不知道用起来感觉怎么样，当时为了奉行我认为好，你就要用的用的原则，先拿一群炮灰提醒大家是很有必要的。你想的没错，就是以前的那些关于旋转的伙伴。吐槽到此结束，开始今天的主题。

由于水平的问题，我在这里主要跟大家推荐一个篇喵神的[blog]，写的很精练，干货，你值得拥有。然后就是对其中一个方法的测试，这是一个
很简单的程序，没有任何UI设计，你只需要将方法添加上去就ok了直接上代码

<code>
	-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>context) {
        if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
            NSLog(@"Compact");
        }else{
            NSLog(@"regular");
        }
    }completion:nil];
}
</code>

读完🐱神的blog，这个程序想要说明神马，你应该一眼就能开明白。不过我有一点不太明白，当你在iPad上测试的时候都是regular，也就是说如果用这种方法判断在iPad上发生是不行的，试想一下，如果我们必须的在iPad实现旋转，并更新UI，那该怎么做？这个我还没找到一个解决方法，如果你有的话，欢迎给我邮件，谢谢。

[blog]:http://www.onevcat.com/2015/06/multitasking/ "blog"