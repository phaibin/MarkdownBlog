---
layout: post
title: 让UISplitViewController始终显示左边的导航
date: 2012-01-17 10:11
categories:
- iphone
tags:
- iphone
- UISplitViewController
published: true
comments: true
---
iOS5之后UISplitViewControllerDelegate加了一个方法，可以让左边的导航始终显示，就是– splitViewController:shouldHideViewController:inOrientation:方法。但是iOS4里面是没有这个方法的，不能这么用。iOS4里面好像只能自己放两个view来显示了。不过如果你的app不上app store的话，这里有一个私有方法可以用：

    [splitViewConntroller setHidesMasterViewInPortrait:NO];
 
