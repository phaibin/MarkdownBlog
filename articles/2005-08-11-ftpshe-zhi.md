---
layout: post
title: FTP设置
date: 2005-08-11 00:38
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><p>1.默认FTP的启动:编辑inetd.conf, 去掉ftp的注释, ftp 0登陆到本机。<br />2.wu-ftp:启动:编辑inetd.conf, 更改ftp的路径为:/usr/local/libexec/ftpd。<br />&nbsp;&nbsp; 配置用户只能在自己的目录操作:切换目录到/usr/local/etc, 把以ftp开头的5个文件都重命名一下, 去掉example, 编辑ftpaccess, 最后添上:restricted-uid *; 然后编辑inetd.conf, 把ftpd的参数在'-l'后添上'-a'。</p></p>
