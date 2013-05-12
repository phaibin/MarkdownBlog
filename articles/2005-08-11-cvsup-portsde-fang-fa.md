---
layout: post
title: CVSup ports的方法
date: 2005-08-11 00:39
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><p>1.用sysinstall安装 net/cvsup package<br />2.拷贝 /usr/share/examples/cvsup/ports-supfile 到一个新的目录, 如 /root&nbsp;或你的主目录<br />3.编辑 ports-supfile, 修改 <font size="2">*default host=</font>CHANGE_THIS.FreeBSD.org 为cvsup3.FreeBSDChina.org<br />4.运行 cvsup -g -L 2 /root/ports-supfile<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -g告诉 CVSup 不要使用 GUI。如果您 没在运行 X11 这个是自动的，否则您必须指定它。<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -L 2&nbsp;告诉 CVSup 输出所有正在升级的文件的细节。 有三个等级可以选择，从 -L 0&nbsp;到 -L 2。默认是 0，意味着除了错误消息 什么都不输出。</p></p>
