---
layout: post
title: Property’s synthesized getter follows Cocoa naming convention for returning
  ‘owned’ objects
date: 2013-01-23 16:43
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
参考：<http://pyanfield.wordpress.com/2011/12/19/propertys-synthesized-getter-follows-cocoa-naming-convention-for-returning-owned-objects/>

之前在代码中加入一个property，名为：`newPasswordField`，然后就报了这个错。试着把property的名字改了一下，改为：`newerPasswordField`，然后错误就没了。因为着急也没去管为什么，今天偶尔让我看到了原因。

原因就是如果项目启用了ARC，给属性起名的时候就不能以new或者copy开头。或者你也可以给getter起个别名：
    @property (getter=theNewTitle) NSString *newTitle;
这样写就是可以的。

具体原因apple也没有讲，估计是害怕编译器出错什么的。
