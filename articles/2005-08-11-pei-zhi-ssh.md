---
layout: post
title: 配置SSH
date: 2005-08-11 00:39
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><p>1.编辑rc.conf ，添加sshd_enable=&quot;YES&quot; <br />2.在/etc/ssh/ssh_config 中<br />&nbsp;&nbsp; &nbsp;＃ PasswordAuthentication yes <br />默认可以用密码登陆，可以改为no，只能用密匙登陆。<br />3.重启<br />4.允许root登陆：编辑/etc/ssh/sshd_config，更改这句：PermitRootLogin yes 。<br />5.用putty直接登陆的方法：运行puttygen，用默认的 SSH-2 RSA 类型产生公匙和私匙，保存。在freebsd里用户的主目录下建立目录.ssh，建立文件<font face="Courier New">authorized_keys</font> ，里面输入公匙的内容。打开putty，在Connection-&gt;Data，Auto-login username 填入用户名。在Connection-&gt;SSH-&gt;Auth中，填入私匙文件的位置。在Session中保存。</p></p>
