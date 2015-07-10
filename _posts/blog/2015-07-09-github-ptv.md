---
layout: post
title: iOS－两个UIViewController之间的传值
description: 两个界面的传值虽然是什么难点，但是如果你是一名新手的话难度还是比较大的，为了感谢各位帮助过我的大神们，写下这篇
blog，一是为了表示感谢，二是为了帮助新手们。
category: blog
---

首先开篇我要告诉各位新手们，两个界面的传值最好的办法还是用代理模式（不懂的孩子自觉Google）好一点，我今天是为了懒省事，所以
这样做了，稍后我在更新用代理模式传值的方法。

既然是两个UIViewController传值，那么久直觉创建一个两个界面的工程吧，样子大概是这个样子。
<img src="/images/blog/tsv/ui_tv">

相信你做出这样一个界面应该是妥妥的没问题。现在我来简单介绍一下，首先将ViewController设置为UINavigationController的
根控制器，然后添加一个textfield和uibutton，然后在拉出一个viewcontroller，命名为TextfieldViewController，添加一个lable，用一个showsegue链接起来，并给他一个标示，在这里我用的是abc，作者很懒，这个名字还是费了好长时间才想出来的。

    完成上述之后我大致说下咱们的要求，要求就是将ViewController里inputTextField里面的值传到TV（TextFiledViewControlle
r的简写，下同）,这个时候我们要在TV声明一个变量，以供传值使用喔把他命名为str，完成所有的事情之后我们就可以开始我们的代码了。
<code>
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   if ([segue.identifier isEqualToString:@"abc"]) {
     TextfieldViewController *vc = (TextfieldViewController *)segue.destinationViewController;
     vc.str = self.inputTextField.text;
   }
}
</code>

正如你看到的，就这些代码就能完成我们要求了。具体为什么这样做能实现要求，这个我还真没搞太懂，这里我就不将自己的理解告诉大家了，一面误人子弟。稍后我会把源码分享到我的github上，链接稍后奉上