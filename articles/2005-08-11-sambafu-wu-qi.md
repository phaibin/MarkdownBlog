---
layout: post
title: Samba服务器
date: 2005-08-11 00:35
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><div class="diaryContent" id="diary927376">1.装完后主配置文件在/usr/local/etc/smb.conf.default, cp smb.conf.default smb.conf。然后编辑/etc/inetd.conf, 把最后三行的注释去掉：<br />&nbsp;&nbsp; netbios－ssn.....<br />&nbsp;&nbsp; netbios-ns......<br />&nbsp;&nbsp; swat......<br />重启inetd，运行netstat －a，发现有*.swat和*.netbios-ssn服务，说明已经开启了。<br />2.运行smbclient -L //192.168.0.2<br />password 直接回车<br />这样就以匿名登陆到samba服务器上<br />3.添加samba用户:首先用户要存在于系统中, 键入smbpasswd -a wen<br />New SMB password: 输入密码<br />Retype new SMB password: <br />Added user wen<br />4.在/etc/rc.conf中加入inetd_enable=&quot;YES&quot;。</div><div class="diaryContent">5.开启了swat就可以用网页来配置samba，输入<a href="http://localhost:901">http://localhost:901</a>。</div><div class="diaryContent">6./usr/local/etc/smb.conf文件：</div><div class="diaryContent">[global]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; security = SHARE<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guest account = root</div><div class="diaryContent">[public]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path = /<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read only = No<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guest ok = Yes</div><div class="diaryContent">访问方式是共享访问，默认的guest account是nobody，不能复制、删除和添加文件，改为root就可以完全访问。建立一个共享目录public，路径是/。<br />7.在windows网络连接防火墙里添加</div><div class="diaryContent">NetBIOS 会话服务 TCP&nbsp; 端口139</div><div class="diaryContent">NetBIOS 名称解析 TCP &nbsp;端口137</div><div class="diaryContent">NetBIOS 名称解析 UDP &nbsp;端口137</div><div class="diaryContent">NetBIOS 数据报服务 UDP 端口 138</div><div class="diaryContent">这样在windows网上邻居里就会出现FreeBSD的机器名，打开网上邻居速度也会加快。</div></p>
