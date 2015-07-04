---
layout: post
title: Window初探
description: 今天写程序的时候用到了，查了好几篇blog，最后还是自己查了好久才找到bug，特地来跟新一片blog，一方面提醒大家另外算是纪录自己的成长。
category: blog
---
在开始之前首先感谢网上几位iOS道友无私分享，不过在这里也提醒大家：iOS近两年发展的非常快，请大家一定要打好基础，特别是ARC，作为一个渣渣，我就不多说了。

好了，进入今天的主题，首先给大家说下UIWindow，开始我要很装＊的样子来段英文:
The UIWindow class defines an object known as a window that manages and coordinates the views an app displays on a device screen. Unless an app can display content on an external device screen, an app has only one window.

上面这段英文的大概意思是说UIWindow类定义了一个对象被称为一个窗口,管理和协调视图应用程序显示在设备屏幕上。
除非应用程序可以在一个外部设备屏幕显示内容,应用程序只有一个窗口。（有道翻译）。首先在这里要说一下，苹果公司说除非你在外部设备
屏幕上显示内容，这个说法是不太对的，比如说你现在想要做一个button，且这个button永远浮在屏幕上，就像谁苹果小圆圈（Assistant touch）实现的时候就有可能用到这个，至于具体怎么实现，我也在构想中。

说过了官网给出定义之后我们去看下大神们的说法，说明一下，我并为在官方文档中找到证实一下说法文件。

网上大神认为UIWindow是一种特殊的UIView，主要三个作用
<ol>
	<li>作为容器，包含app所要显示的所有视图</li>
	<li>传递触摸消息的程序中view和其他对象</li>
	<li>与UIViewController协同工作，方便完成设备方向选装的支持</li>
</ol>

说到以上三个作用，第一个相信大家不会有太多的问题。这个作用很明显，我们直接可以看出来。我们来看下第二个作用，我觉得应该就是响应
事件动作，如果大家知道正确的说法，请通知一下。至于第三个，鄙人不太理解，大家自己领悟吧。

UIWindowLevel，UIWindow的一个属性。在这里之所以特意强调这个属性是因为UIWindow在显示的时候会根据他进行排序，Level高的会显示
在低的前面。下面看下关于windowLevel的定义：
<img src="/images/blog/UIWinLeve.png">

<code>
	.h文件
	@property (strong, nonatomic) UIWindow *window;

	@property (strong, nonatomic) UIWindow *alertLevelWindow;
	.m文件
	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIViewController *viewController = [[ViewController alloc] init];
//    viewController.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = viewController;
    NSLog(@"%f", self.window.windowLevel);
    [self.window makeKeyAndVisible];

    CGRect windowRect = CGRectMake(-50,
                                   -50,
                                   [[UIScreen mainScreen] bounds].size.width - 100,
                                   [[UIScreen mainScreen] bounds].size.height - 100);
    _alertLevelWindow = [[UIWindow alloc] initWithFrame:windowRect];
    _alertLevelWindow.windowLevel = UIWindowLevelAlert;
    _alertLevelWindow.backgroundColor = [UIColor greenColor];
    seconde *s = [[seconde alloc] init];
    _alertLevelWindow.rootViewController = s;
//    UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    alertView = s.view;
//    [_alertLevelWindow addSubview:alertView];
    
    NSLog(@"%f", _alertLevelWindow.windowLevel);
    [_alertLevelWindow makeKeyAndVisible];
    
    return YES;
｝
</code>

以上代码运行出来的效果是这样的：
<img src="/images/blog/Level.png">

以上代码说明：大家在看这个代码的时候可以看这个blog<a href="http://www.cnblogs.com/smileEvday/archive/2012/03/27/2420362.html">一片枫叶</a>写的挺好的，不过有点“旧“了。

<ul>
	<li>在ARC模式下，你自己添加的window必须声明为类属性，否在会被提前释放。不懂的同学请恶补下ARC模式</li>
	<li>每一个window必须添加rootViewControler，否则编译的时候会出现bug</li>
</ul>

完成了上述工作之后，大家会发现，虽然现在能正常工作了，不过视图还是不能像自己相信的那样布局。我还在进一步的研究中，欢迎发现问的同学们给回邮件，大家一块讨论我的邮箱是 xuanyuan0511@gmail.com