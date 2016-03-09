---
layout: post
title: NavigationController自定义动画
date: 2012-11-16 11:40
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
代码：
    [UIView transitionWithView:self.navigationController.view duration:0.8 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{ 
      [self.navigationController pushViewController:elementController animated:NO]; 
      [elementController release]; 
    } completion:NULL];
