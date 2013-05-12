---
layout: post
title: 解析sqlite数据库结构的语句
date: 2011-12-29 21:21
categories:
- iphone
tags: []
published: true
comments: true
---
查询所有的表：

    SELECT sql FROM sqlite_master WHERE type = 'table'

查询表结构：

    PRAGMA table_info(table_name);

这个语句真心好使啊。

另外，dump talbe_name命令可以显示出创建和加入数据的sql语句，也是相当好用。
