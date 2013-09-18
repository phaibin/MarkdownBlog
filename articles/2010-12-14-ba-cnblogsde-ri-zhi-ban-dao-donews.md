---
layout: post
title: 把cnblogs的日志搬到donews
date: 2010-12-14 17:36
categories:
- 生活
tags: []
published: true
comments: true
---
在cnblogs的管理界面右上角有一个“备份”的链接：

![Cnblog](/images/articles/cnblog_1.png)

选择时间之后点备份，会导出一个rss格式的xml文件。然后在donews的管理界面，在左边的目录选择“导入”：

![Cnblog](/images/articles/cnblog_2.png)

利用Wordpress的RSS导入功能可以把cnblogs的备份文件导入进来。

不过因为cnblogs的RSS格式跟Wordpress的格式有一些区别，这样导入的日志显示会有些问题。需要对备份文件作一些修改：

在开头的xml声明部分加入：

    xmlns:content="http://purl.org/rss/1.0/modules/content/"

替换所有的 

    <![CDATA[ 

为  

    <content:encoded><![CDATA[

替换所有的 

    ]]>

为 

    ]]></content:encoded>

