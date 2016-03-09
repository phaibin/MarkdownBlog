---
layout: post
title: 中文URL的问题
date: 2011-09-19 07:05
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
在程序中加载一个中文URL的图片，例如这种：

> http://www.txfm.org/UploadFiles/2010-07/admin/中文经典.jpg

始终加载不出来，调试发现用这种字符串生成NSURL的时候返回的是nil。在文档中有这么几句：

> "Must be a URL that conforms to RFC 2396.............If the string was malformed, returns nil."

看来NSURL的使用是很严格的，像这种没有转义的中文是不行的，所以程序中用到URL的地方还是要小心。