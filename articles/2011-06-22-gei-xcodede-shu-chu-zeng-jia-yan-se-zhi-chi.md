---
layout: post
title: 给XCode的输出增加颜色支持
date: 2011-06-22 06:26
categories:
- iphone
tags: []
published: true
comments: true
---
<p>1. 首先从http://culater.net/software/SIMBL/SIMBL.php下载SIMBL，安装<br />
2. 从http://deepit.ru/products/XcodeColors/info/下载XcodeColors.bundle，放到~/Library/Application Support/SIMBL/Plugins/下面<br />
3. 重启XCode</p>

<p>在http://deepit.ru/products/XcodeColors/info/里面有输出颜色的实例代码ColorLog，可以调用里面的函数。<br />
我装完之后建立Cocoa的程序可以显示颜色，但是iphone的程序没有，可以执行<br />
	setenv("XcodeColors", "YES", 1);<br />
打开颜色的支持。</p>
