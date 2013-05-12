---
layout: post
title: NSTextView移除链接样式
date: 2011-11-05 02:53
categories:
- Cocoa
tags:
- cocoa
- NSTextView
published: true
comments: true
---
给NSTextView加入带链接的NSAttributeString的时候，不管怎么调NSAttributeString的属性，链接的颜色和下划线样式都改不掉，原来要调NSTextView的属性：

    [textView setLinkTextAttributes:nil];
