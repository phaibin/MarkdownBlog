---
layout: post
title: XDM配置方法
date: 2005-12-26 01:06
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p>服务器上操作： <br />－－－－－－－－－－－－－－－－－－－－－－－ <br />1. /usr/X11R6/lib/X11/xdm/xdm-config <br />注释掉这句： <br />!DisplayManager.requestPort: 0 <br />－－－－－－－－－－－－－－－－－－－－－－－ <br />2. /usr/X11R6/lib/X11/xdm/Xservers <br />注释掉这句： <br />#:0 local /usr/X11R6/bin/X <br />－－－－－－－－－－－－－－－－－－－－－－－ <br />3. /usr/X11R6/lib/X11/xdm/Xaccess <br />把这句的注释去掉： <br />* #any host can get a login window <br />－－－－－－－－－－－－－－－－－－－－－－－ <br />4. /etc/ttys中 <br />修改如下： <br />ttyv8 &quot;/usr/X11R6/bin/xdm -nodaemon&quot; xterm on secure <br />－－－－－－－－－－－－－－－－－－－－－－－ <br />5. ~/.xsession中(没有则建一个) <br />写入要启动的窗口管理器的启动命令： <br />startxfce4(如果你用kde,就是startkde.gnome就是gnome-session) <br />－－－－－－－－－－－－－－－－－－－－－－－ <br />6. 控制台中运行 <br />xdm <br />－－－－－－－－－－－－－－－－－－－－－－－ <br /><br /><span><b>Xmanager</b></span> 中运行Xbrowser.exe<span class="postsign"></span><span class="gensmall"></span></p>
