---
layout: post
title: iOS6和iOS5中scrollview滚动的区别
date: 2013-01-16 16:12
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
通常在scrollView滚动停止时添加逻辑是加在`scrollViewDidEndDecelerating`方法中，但是今天在一台iOS6的机器中出现了问题，调试发现当平稳拖动scrollView的时候这个方法没有执行。然后调试另外一个方法：

    - (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

发现当平稳拖动scrollView的时候，这个方法的willDecelerate参数为NO，于是scrollView就不会再加速滚动一段了，所以`scrollViewDidEndDecelerating`方法没有执行。

在iOS5里面willDecelerate总是YES的，所以总是会加速滚动，所以代码才没有问题。
