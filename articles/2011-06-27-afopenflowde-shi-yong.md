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
首先，需要在项目中添加OpenFlow开源框架([http://apparentlogic.com/openflow/]),并添加需要显示的图片。

再添加一个RootViewController作为默认页面,该类的头文件定义如下:

    #import <UIKit/UIKit.h>
    #import "AFOpenFlowView.h"
    
    // 实现了AFOpenFlowViewDataSource和AFOpenFlowViewDelegate委托.
    @interface ImageBrowserController : UIViewController<AFOpenFlowViewDataSource, AFOpenFlowViewDelegate> {
    // 用来存储图片对象.
    NSArray *coverImageData;
    }
    // 设置默认显示的图片.
    - (void) imageDidLoad:(NSArray *)arguments;
    @end

在RootViewController.m中，首先重载viewDidLoad方法，用于加载图并生成CoverFlow视图。

    - (void)viewDidLoad{
    // Use sample images, but load them all at once.
    // Load Images.
    coverImageData = [NSArray arrayWithObjects:[UIImage imageNamed:@"2569531.jpg"],
    [UIImage imageNamed:@"2569547.jpg"],
    [UIImage imageNamed:@"2569554.jpg"],
    [UIImage imageNamed:@"V1440x900.jpg"],
    [UIImage imageNamed:@"2569555.jpg"],
    [UIImage imageNamed:@"2569562.jpg"],
    [UIImage imageNamed:@"2569565.jpg"],
    nil];

    // Set the Images in OpenFlow View and set the count of images.
    for (int i=0; i < [array count]; i++) {
    UIImage *orgImage = [array objectAtIndex:i] forIndex:i];
    UIImage *scaleImage = [orgImage cropCenterAndScaleImageToSize:CGSizeMake(440, 556)];
    [(AFOpenFlowView *)self.view setImage: scaleImage];
    }
    [(AFOpenFlowView *)self.view setNumberOfImages:[array count]];
    }

cropCenterAndScaleImageToSize:方法在UIImageExtras.h文件中定义，用来调整图片的大小

现在我们需要设置程序启动时默认显示的图片:

    - (void) imageDidLoad:(NSArray *)arguments{
    UIImage *loadedImage = (UIImage *) [arguments objectAtIndex:0];
    NSNumber *imageIndex = (NSNumber *) [arguments objectAtIndex:1];
    [(AFOpenFlowView *)self.view setImage:loadedImage forIndex:[imageIndex intValue]];
    }

切换图片后调用方法：

    - (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidChange:(int)index

AFOpenFlowConstants.h中定义了一些常量，用来调整图片显示的位置和角度。