---
layout: post
title: apache配置
date: 2005-08-11 00:34
categories:
- FreeBSD
tags: []
published: true
comments: true
---
1.虚拟目录：

    Alias /movie "/movie/"
    <Directory "/movie/">
    AllowOverride None
    Options All
    Order allow,deny
    Allow from all
    </Directory>

2.查看服务器状态：搜索到`#ExtendedStatus On`去掉注释, 在下面添加

    <Location /server-status>
    SetHandler server-status
    Order deny,allow
    Deny from all
    Allow from 192.168.0.1
    </Location>

重启, 然后在浏览器输入/server-status
