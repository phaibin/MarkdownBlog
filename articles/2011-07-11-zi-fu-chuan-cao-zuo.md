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
<p><p>分割字符串:</p>
<p>- (NSArray *)componentsSeparatedByString:(NSString *)separator</p>
<p>相应的数组合并的操作：</p>
<p>- (NSString *)componentsJoinedByString:(NSString *)separator</p>
<p>判断是否以某个字符串结尾：</p>
<p>- (BOOL)hasSuffix:(NSString *)aString</p>
<p>判断是否以某个字符串开头：</p>
<p>- (BOOL)hasPrefix:(NSString *)aString</p>
<p>是否包含某个字符串：</p>
<p>- (NSRange)rangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask</p></p>
