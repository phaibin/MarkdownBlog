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

<img title="NewImage.png" src="http://phaibin.tk/wp-content/uploads/2012/11/NewImage1.png" alt="NewImage" width="280" height="80" border="0" />

要自定义输入位置，或者使用图片，或者定义一个UITextField的子类，然后覆盖下面的方法：
    // placeholder position
    - (CGRect)textRectForBounds:(CGRect)bounds { return CGRectInset(bounds, 10, 10);}
    // text position
    - (CGRect)editingRectForBounds:(CGRect)bounds { return CGRectInset(bounds, 10, 10);}
<img title="NewImage.png" src="http://phaibin.tk/wp-content/uploads/2012/11/NewImage.png" alt="NewImage" width="270" height="63" border="0" />
