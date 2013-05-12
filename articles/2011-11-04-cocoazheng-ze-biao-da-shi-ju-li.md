---
layout: post
title: cocoa正则表达式举例
date: 2011-11-04 06:22
categories:
- Cocoa
tags:
- cocoa
- 正则表达式
published: true
comments: true
---
匹配用matchesInString方法，返回所有的匹配。然后用rangeAtIndex获取分组信息，1为第一个分组

    NSString *regexString = @"<a href="\&quot;(.*)\&quot;" target="\&quot;_blank\&quot;">(.*)</a>";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:NULL];
    NSArray *results = [regex matchesInString:text options:0 range:NSMakeRange(0, 1)];
    NSMutableArray *links = [NSMutableArray array];
    for(id result in results)
    {
        NSString *url = 1];
        NSString *linkString = 1];
        [links addObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSValue valueWithRange:[result range]], @"range", url, @"url", linkString, @"linkString", nil]];
    }

非贪婪模式在后面加?，比如(.\*)写为(.*?)
