---
layout: post
title: 截取图片的一个区域
date: 2011-07-01 01:17
categories:
- iphone
tags: []
published: true
comments: true
---
如果是截取矩形的区域：

CGImage有函数可以截取一张图片的其中一个区域： CGImageCreateWithImageInRect(originImage, rectWanted);

截取圆形或者不规则形状的方法：

![masking_storyboard](/images/articles/masking_storyboard.png)

Creating the mask above is really simple using CoreGraphics on the iPhone. The following is a function that takes two images and uses one to mask the other.

    - (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    CGImageRef maskRef = maskImage.CGImage;

    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
    CGImageGetHeight(maskRef),
    CGImageGetBitsPerComponent(maskRef),
    CGImageGetBitsPerPixel(maskRef),
    CGImageGetBytesPerRow(maskRef),
    CGImageGetDataProvider(maskRef), NULL, false);

    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
    return [UIImage imageWithCGImage:masked];
    }

NOTE: The mask image cannot have ANY transparency. Instead, transparent areas must be white or some value between black and white. The more towards black a pixel is the less transparent it becomes.

也就是用灰度图做遮罩，黑色的部分完全显示，白色的部分不显示，灰色的部分为半透明。