---
layout: post
title: 添加YAJL库的方法
date: 2011-06-22 06:49
categories:
- iphone
tags: []
published: true
comments: true
---
iphone:

- Add YAJLiOS.framework to your project.
- In Build Phases, make sure its listed in Link Binary With Libraries, along with:
	- CoreGraphics.framework
	- Foundation.framework
	- UIKit.framework
- In Build Settings:
	- Under Framework Search Paths make sure the (parent) directory to YAJLiOS.framework is listed.
	- Under Other Linker Flags in your target, add -ObjC and -all_load
- Import with #import <YAJL/YAJL.h>.

Mac:

- Copy YAJL.framework to your project directory (maybe in MyProject/Frameworks/.)
- Add the YAJL.framework files (from MyProject/Frameworks/) to your target.
- In Build Settings, add @loader_path/../Frameworks to Runpath Search Paths. If you don't see Runpath Search Paths make sure All is selected instead of 'Basic'.
- In Build Phases, select Add Build Phase, then Add Copy Files.
	- Change the Destination to Frameworks.
	- Drag YAJL.framework into the the build phase
	- Make sure the copy phase appears before any Run Script phases
- Import with #import <YAJL/YAJL.h>.

项目主页：<https://github.com/gabriel/yajl-objc>

@loader_path 指的是应用程序运行的位置，也就是yourapp.app/Contents/MacOS/yourapp，所以要用一个..。app包的结构是这样的：

![YAJL](/images/articles/yajl.png)