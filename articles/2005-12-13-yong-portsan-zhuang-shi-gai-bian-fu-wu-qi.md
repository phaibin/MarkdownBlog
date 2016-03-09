---
layout: post
title: 用ports安装时改变服务器
date: 2005-12-13 14:48
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><p>在 make fetch 时，系统会依照下列顺序来寻找需要的 source： <br />1. /usr/ports/distfiles 下 <br />2. /etc/make.conf 档中指定的 MASTER_SITE_OVERRIDE<br />3. Makefile 里指定的 MASTER_SITES </p><p>可以把 MASTER_SITE_OVERRIDE 改成： <br />MASTER_SITE_OVERRIDE=ftp://ftp.FreeBSDChina.org/pub/FreeBSD/ports/distfiles/<br /></p></p>
