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
<p>下载地址:<a id="url_1" href="http://developer.apple.com/rss/com.apple.adc.documentation.AppleiPhone4_2.atom" target="_blank">http://developer.apple.com/rss/com.apple.adc.documentation.AppleiPhone4_3.atom</a>
下载后拷贝到/Developer/Documentations/Docset目录下，使用终端命令：<br />
sudo xar -xf 下载的文件名.xar<br />
将其解压，然后使用:<br />
sudo chown -R -P devdocs 解压后的文件名.docset<br />
将文档的所有者改为devdocs。打开Xcode就可以离线浏览了。</p>
