---
layout: post
title: 判断iOS设备能不能打电话
date: 2012-12-29 18:27
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
代码：
    [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
