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
<p><p>1.虚拟目录：<br />Alias /movie &quot;/movie/&quot;<br />&lt;Directory &quot;/movie/&quot;&gt;<br />AllowOverride None<br />Options All<br />Order allow,deny<br />Allow from all<br />&lt;/Directory&gt;<br />2.查看服务器状态：<br />搜索到#ExtendedStatus On<br />去掉注释, 在下面添加:<br />&lt;Location /server-status&gt;<br />SetHandler server-status<br />Order deny,allow<br />Deny from all<br />Allow from 192.168.0.1<br />&lt;/Location&gt;<br />重启, 然后在浏览器输入/server-status</p><br /></p>
