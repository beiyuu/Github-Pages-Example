---
layout:     post
title:      iOS-QR
category: blog
description: 原生的二维码扫描
---
今天总算是把二维码这一块给搞定了。额，看了好多博客，也算是历尽坎坷啊，今天跟大家分享一下，亲测，Xcode6.3, OS X 10.4无压力通过

今天我所展示给大家的是利用apple公司原声的框架来实现扫码功能。首先说一下程序的流程，只要按照这个流程你也能写出属于自己的扫码程序。
<ol>
	<li>创建一个捕捉对话</li>
	<li>获得截取的图像，并生成预览</li>
	<li>重写代理，输出结果</li>
</ol>

大致的流程就是上面这个样子，好下面贴代码

<code>
	//创建对话
	@property (strong, nonatomic) AVCaptureSession *session;
	//视频画面预览
	@property (strong, nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;
</code>

上面这两个声明应该没什么好说的。我们继续往下走

<code>
	self.session = [[AVCaptureSession alloc] init];
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    if (input) {
        [self.session addInput:input];
    }else{
        NSLog(@"The device can`t use");
        return;
    }
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [self.session addOutput:output];
    //添加元数据代理
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    //扫描类型
    output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeFace];
    //视频预览层 与 视频捕捉会话关联
    self.videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    CGRect frame = CGRectMake(self.view.center.x-100, self.view.center.y-100, 200, 200);
    self.videoPreviewLayer.frame = frame;
</code>

上面的代码我已经将必要的注释写在了上面。不过还是说明一下，大家可以看到在输出类型中我在其中添加了三种类型。还有条形码和人脸。大家可以看自己的需要，在实现协议的时候自己看着来。下面咱们看下协议的实现：

<code>
	if (metadataObjects != nil && metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects firstObject];
        if ([[metadataObject type] isEqualToString:AVMetadataObjectTypeQRCode]){
            NSLog(@"%@", metadataObject);
        }
    }
</code>

最后输出的结果就是图像中的内容了，好了到此今天的内容就完结。

今天在网上看到了一个困扰了我很久的问题，就是怎样设置扫描的有效区域。下面我就为大家介绍这么个属性。
@property ( nonatomic ) CGRect rectOfInterest NS_AVAILABLE_IOS ( 7 _0);
官网行的解释是：
@discussion
The value of this property is a CGRect that determines the receiver's rectangle of interest for each frame of video.  
The rectangle's origin is top left and is relative to the coordinate space of the device providing the metadata.  Specifying 
a rectOfInterest may improve detection performance for certain types of metadata. The default value of this property is the 
value CGRectMake(0, 0, 1, 1).  Metadata objects whose bounds do not intersect with the rectOfInterest will not be returned.

大家都是英语好的一水的人，我就不翻译给大家看了。不过大概意思我还是给带说一下，有第一句话我们可以知道这个属性的值是决定区域，就是你每一帧画面中你感兴趣的区域。我*，不就是我们想要的吗？不过注意，他的起始原点在左上方，默认值是（0， 0， 1， 1），也就是说这事个比例值，记得将你设置好的区域转化比例值哦。