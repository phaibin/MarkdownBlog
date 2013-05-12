---
layout: post
title: NSString中的path操作
date: 2011-08-22 03:38
categories:
- iphone
tags:
- NSString
published: true
comments: true
---
<p><ul>
<li>lastPathComponent：返回path的最后一部分，比如文件或者目录的名字</li>
<li>pathExtension: 返回path最后一部分的扩展名，比如.txt</li>
<li>stringByExpandingTildeInPath: 把表示用户主目录的~展开</li>
<li>stringByDeletingLastPathComponent: 返回path最后一部分之前的部分，就是文件或者目录的完整路径</li>
<li>stringByDeletingPathExtension：返回path除掉文件扩展名之后的部分</li>
<li>stringByAppendingPathComponent: 把一个字符串作为path的一部分加进去，自动判断字符串是否包含路径分隔符</li>
</ul>
<p>获取特殊目录的方便方法：</p>
<ul>
<li>NSUserName()：unix-style用户名</li>
<li>NSFullUserName()：用户全名</li>
<li>NSHomeDirectory()：用户的home目录</li>
<li>NSTemporaryDirectory()：temp目录</li>
</ul>
<p>NSHomeDirectory()在cocoa touch中也可以用，返回的是app的根目录。</p></p>
