---
layout: post
title: 安装FreeBSD系统的步骤
date: 2005-12-22 22:03
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p>1.<a href="http://blog.donews.com/phaibin/archive/2005/08/11/503454.aspx" target="_blank">配置SSH</a>。<br />2.编辑rc.conf，加入sendmail_enable=&quot;NONE&quot;。重要文件rc.conf。<br />3.<a href="http://blog.donews.com/phaibin/archive/2005/08/11/503462.aspx" target="_blank">配置shell</a>，重要文件<font color="#cc0000">~/.cshrc</font>（root用户是/root/.cshrc，一般用户是/usr/home/wen/.cshrc）。<br />4.用sysinstall安装<a href="http://blog.donews.com/phaibin/archive/2005/08/11/503452.aspx" target="_blank">cvsup-without-gui</a>，然后更新ports树。重要文件~/ports-supfile。<br />5.用sysinstall安装portupgrade。<br />6.用<a href="http://blog.donews.com/phaibin/archive/2005/12/20/664542.aspx" target="_blank">portupgrade</a>安装axel。重要文件/usr/local/etc/pkgtools.conf。<br />7.升级所有软件。<br />8.安装其他软件。<br />9.安装vmare tools。<br />10.配置桌面环境。</p>
