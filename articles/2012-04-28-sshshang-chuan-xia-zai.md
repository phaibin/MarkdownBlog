---
layout: post
title: ssh上传下载
date: 2012-04-28 13:46
categories:
- iphone
tags: []
published: true
comments: true
---
上传：

    scp test.sql zhangying@192.168.1.5:/var/www/zhangying

下载：

    scp zhangying@192.168.1.5:/var/www/zhangying/test.sql /home/zhangy/database_bak/
