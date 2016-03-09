---
layout: post
title: stretchableImage
date: 2011-12-16 10:27
categories:
- iphone
tags:
- iphone
- stretchableImage
published: true
comments: true
---
在stretchableImage上浪费了大半天时间了，我无语了。

下面两种写法你能看出区别么：

    UIImage *image = [[UIImage imageNamed:@"bar_bg.png"]stretchableImageWithLeftCapWidth:20 topCapHeight:0];

    UIImage *bgImage = [UIImage imageNamed:@"bar_bg.png"];
    [bgImage stretchableImageWithLeftCapWidth:20 topCapHeight:0];

反正我一开始没看出来。我开始用的第二种写法，但是图片显示总是有问题。试过了很多次之后试着换成第一种写法居然就好了。

翻开API查看原来是我自己的理解有误。stretchableImageWithLeftCapWidth:topCapHeight:并不是把当前的图片拉伸，而是返回一个新的图片。唉，又是不仔细看文档的后果。
