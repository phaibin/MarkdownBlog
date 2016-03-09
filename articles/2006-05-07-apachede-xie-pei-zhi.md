---
layout: post
title: Apache的一些配置
date: 2006-05-07 10:48
categories:
- 网页
tags: []
published: true
comments: true
---
<p><p>1.AddDefaultCharset gb2312<br />设置默认编码<br />2.要使.htaccess文件生效，要在http.conf文件里加上这个目录的配置<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Directory &quot;D:/phpMyAdmin-2.8.0.3/&quot;&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;AllowOverride&nbsp;All<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/Directory&gt;<br />AllowOverride要设为All</p></p>
