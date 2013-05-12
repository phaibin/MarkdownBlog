---
layout: post
title: FreeBSD 在哪启动程序
date: 2005-08-11 00:31
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><div class="diaryContent" id="diary1007132">一般 FreeBSD 启动后会依序执行以下位置的程序.. <br /><br />1. /etc/rc.conf 这个档案内的程序，如 sendmail、sshd .. 都是在此执行，另外要注意的是，在执行这个档案之前，会先参考 /etc/defaults/rc.conf 的设定 <br /><br />2. /usr/local/etc/rc.d 下的一些 .sh 檔，这些档案的权限都是被设定成 x ，如 apache samba .. 都是在此设定 <br /><br />3. /etc/rc.local 这里也可设定，如我要把 postfix 设定在此，只需在这个档案内加一行，如下 <br /><br />/use/local/sbin/postfix start &amp; <br /><br />加上 &amp; ，就不会显示出讯息 <br /></div></p>
