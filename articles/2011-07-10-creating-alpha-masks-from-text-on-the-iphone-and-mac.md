---
layout: post
title: Creating alpha masks from text on the iPhone and Mac
date: 2011-07-10 07:14
categories:
- iphone
tags: []
published: true
comments: true
---
原文：<http://cocoawithlove.com/2009/09/creating-alpha-masks-from-text-on.html>

效果

![iphone mask](/images/articles/iphone_mask.jpg)

代码：

    - (void)drawRect:(CGRect)rect
    {
        CGContextRef context = UIGraphicsGetCurrentContext();

        // Draw a dark gray background
        [[UIColor darkGrayColor] setFill];
        CGContextFillRect(context, rect);

        // Draw the text upside-down
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 0, rect.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        [[UIColor whiteColor] setFill];
        [text drawInRect:rect withFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:124]];
        CGContextRestoreGState(context);

        // Create an image mask from what we've drawn so far
        CGImageRef alphaMask = CGBitmapContextCreateImage(context);

        // Draw a white background (overwriting the previous work)
        [[UIColor whiteColor] setFill];
        CGContextFillRect(context, rect);

        // Draw the image, clipped by the mask
        CGContextSaveGState(context);
        CGContextClipToMask(context, rect, alphaMask);

        [[UIImage imageNamed:@"shuttle.jpg"] drawInRect:rect];
        CGContextRestoreGState(context);
        CGImageRelease(alphaMask);
    }

原理是先把文字绘制到灰度图上，然后根据context创建一个mask image，调用CGContextClipToMask使image作为mask，然后绘制图片，这时候mask中白色的部分会完全显示，黑色的部分不显示。