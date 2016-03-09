---
layout: post
title: /etc/rc.conf(启动配置文件)
date: 2005-08-11 00:42
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><p>defaultrouter=&quot;192.168.4.1&quot; <font color="#cc0000">//网关</font><br />hostname=&quot;chu888.com&quot;<br />ifconfig_Inc0=&quot;inet 192.168.4.118&nbsp;&nbsp;&nbsp; netmask 255.255.255.0&quot;<br />inetd_enable=&quot;YES&quot; <font color="#cc0000">//超级守护进程</font><br />kern_securelevel=&quot;2&quot; <font color="#cc0000">//安全级别<br /></font>kern_securelevel_enable=&quot;YES&quot;<br />nfs_server_enable=&quot;NO&quot;<br />sendmail_enable=&quot;NO&quot; <font color="#cc0000">//改为&quot;none&quot;<br /></font>sshd_enable=&quot;NO&quot;<br />usbd_enable=&quot;YES&quot;</p></p>
