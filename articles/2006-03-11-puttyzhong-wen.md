---
layout: post
title: putty中文
date: 2006-03-11 09:48
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p>打开putty主程序，选择window-〉Appearance-〉Font settings-〉Change...,选择Fixedsys字体,字符集选择CHINESE_GB2312。在window-〉Appearance-〉Translation中，Received data assumed to be in which character set 中,把Use font encoding改为UTF-8(不行的话就改为Use font encoding),如果经常使用,把这些设置保存在session里面. 现在打开putty,登录成功后,在shell中输入:export LC_ALL='zh_CN.utf8',现在已经可以完美的支持中文了:)</p>
