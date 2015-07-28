---
layout: post
title: iOS-保存账号和密码
description: iOS不用sqlite实现保存密码，很方便。
category: blog
---

这是我刚才才实现的功能，为什么这么着急分享给大家那，因为我我觉得这个真的困扰了我很久，怎样方便快速的实现客户端的密码的的存储.这个不是什么很难的地方。网上有很多着中教程：例如，sqlit， coredata...好多。

但是就从笔者自己的感觉来讲，我觉的NSUserDe－faults比较适合储存一些储存一些少的，简单的数据，比如说app的配置文件，毕竟没有一个app就设置一项就成百上千，额，真是那样，这个app果断放弃的节奏,还有就是咱们今天说客户端的密码和账号

至于sqlit，因为本人现在对于coredata不甚了解，所以现在所用的都是sqlit，我用的是一个框架[FMDB]，我用着还行，个人比较喜欢,最起码不用自己写当量sql语句，这个一定程度来说对我很重要，具体的用法，大家可以去FMDB的github上去看。觉得比人写的比我好多了。

另外还有好多数据持久化的方法，比如说为了更好的网络体验，我们通常会将第一次网络缓存本地化，当第二次发送同样的请求时，我们不会在想服务器发送请求，而是直接从本地获得数据，我们只是在自己确实有需要的时候才再次发送网络，不仅很好的节省了本身开销，还给用户更好的体验。这个我正在研究中，不久的会再次更新一篇blog向大家说明。

开始今天的今天的主题。首先咱们创建工程，界面非常的简单，两个输入框，一个按钮。然后直接在按钮中添加一个action，现在这里说明一下，NSDefault是单例模式。首先咱们要讲我们的数据储存到NSDefaults中代码如下：
<code>
	NSString *str1 = self.userPsd.text;
    NSString *str2 = self.userPsd.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:str1 forKey:@"userid"];
    [defaults setObject:str2 forKey:@"userpsd"];
    [defaults synchronize];
</code>

上面的代码很简单，相信大家一眼就能看明白有一点说明一下，大家最后把最后的代码加上去。存储好就是加载了。相信大家应该已经想到加载的代码了：
<code>
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str1 = [defaults objectForKey:@"userid"];
    NSString *str2 = [defaults objectForKey:@"userpsd"];
    self.userPsd.text = str2;
    self.userID.text = str1;
</code>

有必要告诉大家一下，其实在第一遍程序运行的时候直接进行加载是不合理的，大家最好进行判断一下，然后在决定是否加载。

好了，demo大致就是这个样子，稍后我会更新demo的下载地址。
[FMDB]:  https://github.com/ccgus/fmdb  "FMDB"