---
layout: post
title: 让tableview的背景透明
date: 2012-01-13 09:39
categories:
- iphone
tags:
- iphone
- tableview
published: true
comments: true
---
代码：

    tableView.backgroundColor = [UIColor clearColor];
    tableView.opaque = NO;
    tableView.backgroundView = nil;
