---
layout: post
title: 把字符串进行URL转义的函数
date: 2011-06-23 05:57
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>@implementation NSString (Escaping)<br />- (NSString*)stringWithPercentEscape <br />{                <br /> return [(NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)[[self mutableCopy] autorelease], NULL, CFSTR("=,!$&amp;'()*+;@?n"&lt;&gt;#t :/"),kCFStringEncodingUTF8) autorelease];<br />}<br />@end</p></p>
