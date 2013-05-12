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
<p>[code lang="objc"]<br />
+ (UIImage *)scaleImage:(UIImage*)img toSize:(CGSize)size  <br />
{  <br />
    // 把它设置成为当前正在使用的context  <br />
    UIGraphicsBeginImageContext(size);  <br />
    // 绘制改变大小的图片  <br />
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];  <br />
    // 从当前context中创建一个改变大小后的图片  <br />
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();  <br />
    // 使当前的context出堆栈  <br />
    UIGraphicsEndImageContext();  <br />
    // 返回新的改变大小后的图片  <br />
    return scaledImage;  <br />
}
[/code] </p>
