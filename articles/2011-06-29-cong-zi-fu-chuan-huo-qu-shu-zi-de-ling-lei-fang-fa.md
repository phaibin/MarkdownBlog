---
layout: post
title: 从字符串获取数字的另类方法
date: 2011-06-29 06:04
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>[[text componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];</p>
<p>[NSCharacterSet decimalDigitCharacterSet]是所有数字的集合，invertedSet方法取反，也就是所有不是数字的字符。</p>
<p>先用componentsSeparatedByCharactersInSet方法根据非数字分割，然后连接起来。</p></p>
