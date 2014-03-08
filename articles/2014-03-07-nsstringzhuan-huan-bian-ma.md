---
title: NSString转换编码
date: 2014-03-07 17:19
---
    NSString *s = @"文祥";
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *gbk = [NSString stringWithCString:[s cStringUsingEncoding:enc] encoding:enc];