---
layout: post
title: 实现定制的URL模式
date: 2011-07-28 02:31
categories:
- iphone
tags: []
published: true
comments: true
---
您可以为自己的应用程序注册包含定制模式的URL类型。定制的URL模式是第三方应用程序和其它程序及系统进行交互的机制。通过定制的URL模式，应用程序可以将自己的服务提供给其它程序。

图1-7 在Info.plist文件中定义一个定制的URL模式



然后在safari中输入：todolist:就可以访问你的程序。在代码中应该这么写：

    NSURL *myURL = [NSURL URLWithString:@"todolist://www.acme.com?Quarterly%20Report#200806231300"];
    [[UIApplication sharedApplication] openURL:myURL];

苹果内置支持http、mailto、tel、和sms这些URL模式，还支持基于http的、指向Maps、YouTube、和iPod程序的URL。
