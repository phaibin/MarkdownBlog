---
layout: post
title: iphone缩放图片
date: 2011-08-31 01:16
categories:
- iphone
tags: []
published: true
comments: true
---
    + (UIImage *)scaleImage:(UIImage*)img toSize:(CGSize)size 
    { 
        // 把它设置成为当前正在使用的context 
        UIGraphicsBeginImageContext(size); 
        // 绘制改变大小的图片 
        [img drawInRect:CGRectMake(0, 0, size.width, size.height)]; 
        // 从当前context中创建一个改变大小后的图片 
        UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext(); 
        // 使当前的context出堆栈 
        UIGraphicsEndImageContext(); 
        // 返回新的改变大小后的图片 
        return scaledImage; 
    }