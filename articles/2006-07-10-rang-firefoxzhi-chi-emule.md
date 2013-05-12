---
layout: post
title: 让firefox支持Emule
date: 2006-07-10 18:42
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p>1、在地址栏输入about:config，进入配置页面<br />2、在列表上单击右键，新建一个布尔值（Boolean）值，名字是network.protocol-handler.external.ed2k，值为true。<br />3、再新建一个字符串值（String），名字是network.protocol-handler.app.ed2k，值为你的启动程序，我在Linux下用aMule，所以是&ldquo;/usr/bin/ed2k.amule&rdquo;。<br /><br />这样，当点出ed2k://的链接里就会把地址加入相应软件了。</p>
