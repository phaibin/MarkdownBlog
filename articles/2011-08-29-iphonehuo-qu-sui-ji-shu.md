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
<p><p>原文：<a href="http://iphonedevelopment.blogspot.com/2008/10/random-thoughts-rand-vs-arc4random.html">http://iphonedevelopment.blogspot.com/2008/10/random-thoughts-rand-vs-arc4random.html</a></p>
<p>很多人获取随机数的时候会调用rand()，在设置种子之后：</p>
<p>srandom(time(NULL));</p>
<p>但是rand()并不是一个很好的随机数生成器，arc4random()更好，它用了真正的伪随机数算法，并且精度是rand()的两倍。arc4random()也不需要设种子，它会在第一次调用的时候自动设置。</p>
<p>获取0到x-1之间的随机数：</p>
<p>int value = arc4random() % x;</p>
<p>获取1到x之间的随机数：</p>
<p>int value = (arc4random() % x) + 1;</p>
<p>如果想获取浮点随机数，加入下面的语句：</p>
<p>#define ARC4RANDOM_MAX    0x100000000</p>
<p>获取0到100之间的随机数：</p>
<p>double val = floorf(((double)arc4random() / ARC4RANDOM_MAX) * 100.0f);</p></p>
