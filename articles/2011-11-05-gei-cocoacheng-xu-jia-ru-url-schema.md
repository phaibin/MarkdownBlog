---
layout: post
title: 给cocoa程序加入URL schema
date: 2011-11-05 10:43
categories:
- Cocoa
tags:
- cocoa
- url schema
published: true
comments: true
---
类似iphone，cocoa中也可以实现URL schema（其实应该是cocoa先实现，不过我是先学iphone）。

加入URL schema跟iphone项目一样，参照我另一篇文章：[实现定制的url模式](http://asdf)

然后在响应URL的类中加入注册schema的方法：

    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];

handelURLEvent的例子是：

    - (void)handleURLEvent:(NSAppleEventDescriptor*)event withReplyEvent:(NSAppleEventDescriptor*)replyEvent
    {
      NSString* url = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];    
      NSLog(@"%@", url);
    }

Apple官方文档：[Installing a Get URL Handler](http://developer.apple.com/mac/library/DOCUMENTATION/Cocoa/Conceptual/ScriptableCocoaApplications/SApps_handle_AEs/SAppsHandleAEs.html#//apple_ref/doc/uid/20001239-SW10)

至于调用URL的方法，在iphone中是[[UIApplication sharedApplication] openURL:url]，于是我想当然的写了：

    [NSApp openURL:url];

结果总是提示出错。查了半条才发现原来不是这么写的，需要这么写才对：

    [[NSWorkspace sharedWorkspace] openURL:url];

很疑惑为什么是这样的。
