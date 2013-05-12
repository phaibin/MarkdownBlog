---
layout: post
title: CGContextAddArc在Cocoa与Cocoa Touch中的区别
date: 2011-06-27 07:24
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>CGContextAddArc的最后一个参数是clockwise，用来指明按照什么方向来画弧。本来1代表顺时针，0代表逆时针。但是Cocoa Touch相比Cocoa对Y轴做了翻转，向下为正方向，所以这个参数的意义也反过来了，变成0代表顺时针，1代表逆时针。做iphone开发的时候记得这个规则就行了。</p></p>
