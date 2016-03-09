---
layout: post
title: 移动滚动条到底端的方法
date: 2011-07-15 09:49
categories:
- iphone
tags: []
published: true
comments: true
---
    CGPoint bottomOffset = CGPointMake(0, [textView contentSize].height - textView.frame.size.height);
    if (bottomOffset.y > 0) 
      [textView setContentOffset: bottomOffset animated: YES];
