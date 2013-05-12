---
layout: post
title: iphone中，如何用NSLog打印一个结构体的信息
date: 2011-07-19 06:50
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>iphone开发中，会涉及到很多结构体，比如CGAffineTransform CGPoint等等。很多时候，我们需要把他们得值打印出来，以便跟踪调试。一个一个成员得打印出来，固然可以，但是太影响效率了。试试NSString得强大功能把，Iphone sdk中带了很多NSString相关得函数，可以把很多常用得结构体，直接格式化为字符串，比如NSStringFromCGPoint，NSStringFromCGAffineTransfrom等等。<br />然后用 NSLog(@“%@”, NSStringFromCGAffineTransfrom(transform)); 打印即可。</p></p>
