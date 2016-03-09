---
layout: post
title: su命令
date: 2005-12-11 13:37
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p>用户执行su命令必须是wheel组的成员，要改变用户的组，编辑/etc/group文件，格式为：<br />&nbsp;&nbsp;&nbsp; wheel:*:10:root,boo,frank<br />分别为：组名，一个&ldquo;哑&rdquo;字段（如果有密码时就用来存放密码），组ID和一个用逗号进行分割的组中所包含的用户。<br />（摘自《FreeBSD技术内幕》P209）</p>
