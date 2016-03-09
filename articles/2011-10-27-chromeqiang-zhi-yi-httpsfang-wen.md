---
layout: post
title: Chrome强制以https访问
date: 2011-10-27 01:22
categories:
- 生活
tags:
- chrome
published: true
comments: true
---
众所周知的原因，很多网站需要用https才能访问，但是很多链接要改来改去很麻烦。Chrome的一个内置功能可以自动以https来访问网站：

在Chrome的地址栏输入chrome://net-internals/，在HSTS的标签栏里Domain里填上需要访问的domain。然后选中Include subdomains，点击Add按钮即可，这样所有访问这个域名（包括子域名）都自动转到https了。
