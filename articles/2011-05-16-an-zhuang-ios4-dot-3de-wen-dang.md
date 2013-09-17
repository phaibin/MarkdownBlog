---
layout: post
title: 安装iOS4.3的文档
date: 2011-05-16 09:10
categories:
- iphone
tags: []
published: true
comments: true
---
下载地址:<http://developer.apple.com/rss/com.apple.adc.documentation.AppleiPhone4_3.atom>

下载后拷贝到/Developer/Documentations/Docset目录下，使用终端命令：

    sudo xar -xf 下载的文件名.xar

将其解压，然后使用:

    sudo chown -R -P devdocs 解压后的文件名.docset
    
将文档的所有者改为devdocs。打开Xcode就可以离线浏览了。
