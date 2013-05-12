---
layout: post
title: 把UIImage对象保存为PNG或JPEG文件
date: 2011-07-22 09:40
categories:
- iphone
tags: []
published: true
comments: true
---
<p>[code lang="objc"]<br />
// Create paths to output images<br />
NSString  *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@&quot;Documents/Test.png&quot;];<br />
NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@&quot;Documents/Test.jpg&quot;];<br />
 
// Write a UIImage to JPEG with minimum compression (best quality)<br />
// The value 'image' must be a UIImage object<br />
// The value '1.0' represents image compression quality as value from 0.0 to 1.0<br />
[UIImageJPEGRepresentation(image, 1.0) writeToFile:jpgPath atomically:YES];<br />
 
// Write image to PNG<br />
[UIImagePNGRepresentation(image) writeToFile:pngPath atomically:YES];<br />
 
// Let's check to see if files were successfully written...<br />
 
// Create file manager<br />
NSError *error;<br />
NSFileManager *fileMgr = [NSFileManager defaultManager];<br />
 
// Point to Document directory<br />
NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@&quot;Documents&quot;];<br />
 
// Write out the contents of home directory to console<br />
NSLog(@&quot;Documents directory: %@&quot;, [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&amp;error]);<br />
[/code] </p>
