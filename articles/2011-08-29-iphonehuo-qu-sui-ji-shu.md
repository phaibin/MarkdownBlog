---
layout: post
title: iphone获取随机数
date: 2011-08-29 04:25
categories:
- iphone
tags: []
published: true
comments: true
---
原文：<http://iphonedevelopment.blogspot.com/2008/10/random-thoughts-rand-vs-arc4random.html>

很多人获取随机数的时候会调用rand()，在设置种子之后：

    srandom(time(NULL));

但是rand()并不是一个很好的随机数生成器，arc4random()更好，它用了真正的伪随机数算法，并且精度是rand()的两倍。arc4random()也不需要设种子，它会在第一次调用的时候自动设置。

获取0到x-1之间的随机数：

    int value = arc4random() % x;

获取1到x之间的随机数：

    int value = (arc4random() % x) + 1;

如果想获取浮点随机数，加入下面的语句：

    #define ARC4RANDOM_MAX    0x100000000

获取0到100之间的随机数：

    double val = floorf(((double)arc4random() / ARC4RANDOM_MAX) * 100.0f);
