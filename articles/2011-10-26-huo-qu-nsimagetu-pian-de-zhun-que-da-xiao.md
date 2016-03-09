---
layout: post
title: 获取NSImage图片的准确大小
date: 2011-10-26 06:12
categories:
- Cocoa
tags:
- cocoa
published: true
comments: true
---
我在做微博程序显示图片的时候，发现一个问题。有的时候显示的图片比实际大小小，调试了一下发现NSImage保存的size比真实的大小小。搜索了一下发现在NSImage的representations里面保存的大小才是真实的像素大小。

于是写了一个方法来修复：

    - (void)fixSize
    { 
      NSImageRep *imageRep = [[self representations] lastObject];
      [self setSize:NSMakeSize(imageRep.pixelsWide, imageRep.pixelsHigh)];
    }

今天看到一个人的一篇文章，原来这种方法也不是最安全的，因为NSImage可能并不存在NSBitmapImageRep，最好的解决方法是：

    NSImage *image = [NSImage imageNamed:@"image"]; 
    NSBitmapImageRep *rep = [NSBitmapImageRep imageRepWithData:[image TIFFRepresentation]]; 
    NSSize size = NSMakeSize([rep pixelsWide], [rep pixelsHigh]); 
    [image setSize: size]; 
