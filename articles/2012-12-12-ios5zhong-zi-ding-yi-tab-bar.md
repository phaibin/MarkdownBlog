---
layout: post
title: iOS5中自定义tab bar
date: 2012-12-12 15:59
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
参考：<http://kashiv.com/2012/05/17/create-a-twitter-like-uitabbar-using-uiappearance-proxy/>

首先在AppDelegate.m中加入：
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"YourCustomBkgImage.png"]];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"YourCustomSelectionIndicator.png"]]; 
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithWhite:0.5 alpha:1], UITextAttributeTextColor, [UIColor blackColor], UITextAttributeTextShadowColor, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithWhite:0.85 alpha:1], UITextAttributeTextColor, [UIColor blackColor], UITextAttributeTextShadowColor, nil] forState:UIControlStateSelected];
然后在每个viewcontroller中加入：
    [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab_image-selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab_image.png"]];
最后的样式为：

![ios5tabbar](http://phaibin.tk/wp-content/uploads/2012/12/ios5tabbar.png)
