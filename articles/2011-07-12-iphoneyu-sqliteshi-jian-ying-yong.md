---
layout: post
title: iphone与Sqlite时间应用
date: 2011-07-12 05:51
categories:
- iphone
tags: []
published: true
comments: true
---
###sqlite

获取当前时间：
> SELECT date('now');

获取当前时间戳：
> SELECT strftime('%s', 'now');

时间函数获取的都是UTC时间，如果要获取本地时间，加上一个'localtime'参数，比如：
> SELECT strftime('%s', 'now', 'lcoaltime');

给时间字段加默认值：
> logtime double default (strftime('%s', 'now', 'lcoaltime'))

###Objective-C

当前时间：
> [NSDate date];

这个时间也是UTC时间，获取本地时间需要用NSTimeZone进行转换：

    NSDate *now = [NSDate date];
    NSTimeZone *destinationTimeZone = [NSTimeZone systemTimeZone];
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:now];
    NSDate* destinationDate = [[[NSDate alloc] initWithTimeInterval:interval sinceDate:now] autorelease];

获取时间间隔:
> NSTimeInterval cha = [aDate timeIntervalSinceDate:anotherDate];
