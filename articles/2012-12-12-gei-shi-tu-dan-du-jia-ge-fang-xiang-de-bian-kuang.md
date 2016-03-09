---
layout: post
title: 给视图单独加一个方向的边框
date: 2012-12-12 15:42
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
代码：
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, 43.0f, toScrollView.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor colorWithWhite:0.8f alpha:1.0f].CGColor;
    [toScrollView.layer addSublayer:bottomBorder];
