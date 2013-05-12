---
layout: post
title: AFOpenFlow的使用
date: 2011-06-27 01:54
categories:
- 生活
tags: []
published: true
comments: true
---
<p><p style="font-size:10pt;color:#333333;font-weight:normal;margin:10px 0;padding:0;"><img src="http://www.devdiv.com/blog/attachment/201007/12/24847_1278924336ONBl.png" alt="" /></p>
<p style="margin:10px 0;padding:0;">首先，需要在项目中添加OpenFlow开源框架([http://apparentlogic.com/openflow/]),并添加需要显示的图片。</p>
<p style="margin:10px 0;padding:0;">再添加一个RootViewController作为默认页面,该类的头文件定义如下:</p>
<p style="margin:10px 0;padding:0;">#import &lt;UIKit/UIKit.h&gt;</p>
<p style="margin:10px 0;padding:0;">#import "AFOpenFlowView.h"</p>
<p style="margin:10px 0;padding:0;">// 实现了AFOpenFlowViewDataSource和AFOpenFlowViewDelegate委托.</p>
<p style="margin:10px 0;padding:0;">@interface ImageBrowserController : UIViewController&lt;AFOpenFlowViewDataSource, AFOpenFlowViewDelegate&gt; {</p>
<p style="margin:10px 0;padding:0;">// 用来存储图片对象.</p>
<p style="margin:10px 0;padding:0;">NSArray *coverImageData;</p>
<p style="margin:10px 0;padding:0;">}</p>
<p style="margin:10px 0;padding:0;">// 设置默认显示的图片.</p>
<p style="margin:10px 0;padding:0;">- (void) imageDidLoad:(NSArray *)arguments;</p>
<p style="margin:10px 0;padding:0;">@end</p>
<p style="margin:10px 0;padding:0;"><br /></p>
<p style="margin:10px 0;padding:0;"> </p>
<p style="margin:10px 0;padding:0;">在RootViewController.m中，首先重载viewDidLoad方法，用于加载图并生成CoverFlow视图。</p>
<p style="margin:10px 0;padding:0;">- (void)viewDidLoad{</p>
<p style="margin:10px 0;padding:0;"><span> </span>// Use sample images, but load them all at once.</p>
<p style="margin:10px 0;padding:0;"><span> </span>// Load Images.</p>
<p style="margin:10px 0;padding:0;"><span> </span>coverImageData = [NSArray arrayWithObjects:[UIImage imageNamed:@"2569531.jpg"],</p>
<p style="margin:10px 0;padding:0;"><span> </span> [UIImage imageNamed:@"2569547.jpg"],</p>
<p style="margin:10px 0;padding:0;"><span> </span> [UIImage imageNamed:@"2569554.jpg"],</p>
<p style="margin:10px 0;padding:0;"><span> </span> [UIImage imageNamed:@"V1440x900.jpg"],</p>
<p style="margin:10px 0;padding:0;"><span> </span> [UIImage imageNamed:@"2569555.jpg"],</p>
<p style="margin:10px 0;padding:0;"><span> </span> [UIImage imageNamed:@"2569562.jpg"],</p>
<p style="margin:10px 0;padding:0;"><span> </span> [UIImage imageNamed:@"2569565.jpg"],</p>
<p style="margin:10px 0;padding:0;"><span> </span> nil];</p>
<p style="margin:10px 0;padding:0;"><span> </span>// Set the Images in OpenFlow View and set the count of images.</p>
<p style="margin:10px 0;padding:0;"><span> </span>for (int i=0; i &lt; [array count]; i++) {</p>
<p style="margin:10px 0;padding:0;">UIImage *orgImage = [array objectAtIndex:i] forIndex:i];</p>
<p style="margin:10px 0;padding:0;">UIImage *scaleImage = [orgImage cropCenterAndScaleImageToSize:CGSizeMake(440, 556)];</p>
<p style="margin:10px 0;padding:0;"><span> </span>[(AFOpenFlowView *)self.view setImage: scaleImage];</p>
<p style="margin:10px 0;padding:0;"><span> </span>}</p>
<p style="margin:10px 0;padding:0;"><span> </span>[(AFOpenFlowView *)self.view setNumberOfImages:[array count]];</p>
<p style="margin:10px 0;padding:0;">}</p>
<p style="margin:10px 0;padding:0;">cropCenterAndScaleImageToSize:方法在UIImageExtras.h文件中定义，用来调整图片的大小</p>
<p style="margin:10px 0;padding:0;"> </p>
<p style="margin:10px 0;padding:0;">现在我们需要设置程序启动时默认显示的图片:</p>
<p style="margin:10px 0;padding:0;">- (void) imageDidLoad:(NSArray *)arguments{</p>
<p style="margin:10px 0;padding:0;"><span> </span>UIImage *loadedImage = (UIImage *) [arguments objectAtIndex:0];</p>
<p style="margin:10px 0;padding:0;"><span> </span>NSNumber *imageIndex = (NSNumber *) [arguments objectAtIndex:1];</p>
<p style="margin:10px 0;padding:0;"><span> </span>[(AFOpenFlowView *)self.view setImage:loadedImage forIndex:[imageIndex intValue]];</p>
<p style="margin:10px 0;padding:0;">}</p>
<p style="margin:10px 0;padding:0;">切换图片后调用方法：</p>
<p style="margin:10px 0;padding:0;">- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidChange:(int)index</p>
<p style="margin:10px 0;padding:0;">AFOpenFlowConstants.h中定义了一些常量，用来调整图片显示的位置和角度。</p>
<p style="margin:10px 0;padding:0;"> </p></p>
