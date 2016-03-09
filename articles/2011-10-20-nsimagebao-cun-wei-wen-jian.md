---
layout: post
title: NSImage保存为文件
date: 2011-10-20 03:23
categories:
- Cocoa
tags:
- iphone
published: true
comments: true
---
    NSArray *representations = [image representations];
    NSData *bitmapData = [NSBitmapImageRep representationOfImageRepsInArray:representations usingType:NSPNGFileType properties:nil];
    [bitmapData writeToFile:[path stringByAppendingPathComponent:@"test.png"] atomically:YES];
