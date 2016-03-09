---
layout: post
title: 字符串操作
date: 2011-07-11 23:22
categories:
- iphone
tags: []
published: true
comments: true
---
分割字符串:

    - (NSArray *)componentsSeparatedByString:(NSString *)separator

相应的数组合并的操作：

    - (NSString *)componentsJoinedByString:(NSString *)separator

判断是否以某个字符串结尾：

    - (BOOL)hasSuffix:(NSString *)aString

判断是否以某个字符串开头：

    - (BOOL)hasPrefix:(NSString *)aString

是否包含某个字符串：

    - (NSRange)rangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask
