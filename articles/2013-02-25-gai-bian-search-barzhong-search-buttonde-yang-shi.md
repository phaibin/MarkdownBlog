---
layout: post
title: 改变search bar中search button的样式
date: 2013-02-25 18:34
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
参考：<http://stackoverflow.com/questions/1200149/styling-the-cancel-button-in-a-uisearchbar#comment13119050_10108613>

这两行代码确实像是神一样的代码，真不明白apple怎么会提供像appearanceWhenContainedIn这样神奇的api。

    [[UIButton appearanceWhenContainedIn:[UISearchBar class], nil] setBackgroundImage:[[UIImage imageNamed:@"search_button_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)] forState:UIControlStateNormal];
    [[UIButton appearanceWhenContainedIn:[UISearchBar class], nil] setBackgroundImage:[[UIImage imageNamed:@"search_button_bg_selected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)] forState:UIControlStateHighlighted];
