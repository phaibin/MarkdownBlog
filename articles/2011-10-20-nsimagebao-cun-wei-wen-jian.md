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
<p>[code lang="objc"]<br />
NSArray *representations = [image representations];<br />
NSData *bitmapData = [NSBitmapImageRep representationOfImageRepsInArray:representations usingType:NSPNGFileType properties:nil];<br />
[bitmapData writeToFile:[path stringByAppendingPathComponent:@&quot;test.png&quot;]  atomically:YES];<br />
[/code] </p>
