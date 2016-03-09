---
layout: post
title: NSString的简体中文编码
date: 2012-06-06 18:08
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
今天写了一个小程序，把plist文件转换为逗号分割的csv文件，然后就可以用excel打开分析。但是在保存为csv文件之后，用文本编辑器打开没有问题，用excel打开就是乱码。于是尝试把保存时候的编码由UTF8改为中文，excel打开就没有问题了。

简体中文的编码写法是：

    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
 
