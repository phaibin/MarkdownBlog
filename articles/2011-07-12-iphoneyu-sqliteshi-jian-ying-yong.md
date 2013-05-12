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
<p><p><span style="font-size:13px;"><strong>sqlite</strong></span>：</p>
<p>获取当前时间：</p>
<p>SELECT date('now');</p>
<p>获取当前时间戳：</p>
<p>SELECT strftime('%s', 'now');</p>
<p>时间函数获取的都是UTC时间，如果要获取本地时间，加上一个'localtime'参数，比如：</p>
<p>SELECT strftime('%s', 'now', 'lcoaltime');</p>
<p>给时间字段加默认值：</p>
<p>logtime double default (strftime('%s', 'now', 'lcoaltime'))</p>
<p><strong>Objective-C</strong>:</p>
<p>当前时间：</p>
<p>[NSDate date];</p>
<p>这个时间也是UTC时间，获取本地时间需要用NSTimeZone进行转换：</p>
<p>
<p>NSDate *now = [NSDate date];</p>
<p>NSTimeZone *destinationTimeZone = [NSTimeZone systemTimeZone];</p>
<p>NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:now];</p>
<p>NSDate* destinationDate = [[[NSDate alloc] initWithTimeInterval:interval sinceDate:now] autorelease];</p>
<div>获取时间间隔:</div>
<div></div>
<div>NSTimeInterval cha = [aDate timeIntervalSinceDate:anotherDate];</div>
</p></p>
