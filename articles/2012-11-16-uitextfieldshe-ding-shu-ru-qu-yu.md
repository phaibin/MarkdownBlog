---
layout: post
title: UITextField设定输入区域
date: 2012-11-16 14:24
categories:
- iphone
tags: []
published: true
comments: true
---
UITextField设置边界为无之后，输入光标会从左边界开始。

![UITextField Input 1](/images/articles/UITextField_Input_1.png)

要自定义输入位置，或者使用图片，或者定义一个UITextField的子类，然后覆盖下面的方法：
    // placeholder position
    - (CGRect)textRectForBounds:(CGRect)bounds { return CGRectInset(bounds, 10, 10);}
    // text position
    - (CGRect)editingRectForBounds:(CGRect)bounds { return CGRectInset(bounds, 10, 10);}

![UITextField Input 2](/images/articles/UITextField_Input_2.png)
