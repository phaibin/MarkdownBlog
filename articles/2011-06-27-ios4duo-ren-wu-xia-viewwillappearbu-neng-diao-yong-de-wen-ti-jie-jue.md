---
layout: post
title: IOS4多任务下，viewWillAppear不能调用的问题解决
date: 2011-06-27 11:34
categories:
- iphone
tags: []
published: true
comments: true
---
由于IOS4支持多任务，应用程序按【home】是只是转到当前活动应用的后面，并没有退出，相当于画面暂停了。可以在

    - (void)applicationDidEnterBackground:(UIApplication *)application

里面运行viewWillDisappear方法。在

    - (void)applicationWillEnterForeground:(UIApplication *)application

里面运行viewWillAppear方法。
