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
    @implementation NSString (Escaping)
    - (NSString*)stringWithPercentEscape 
    {                
    return [(NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)[[self mutableCopy] autorelease], NULL, CFSTR("=,!$&'()*+;@?n"<>#t :/"),kCFStringEncodingUTF8) autorelease];
    }
    @end