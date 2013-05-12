---
layout: post
title: 管理员忘记密码的处理
date: 2005-08-11 00:40
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><p>reboot<br />重启<br />启动到Loading Kernel的时候,按空格,出现ok提示符<br />boot -s<br />以单用户的形式启动<br />fsck -y<br />检查文件系统的完整性<br />mount -a<br />挂载所有的文件系统<br />passwd<br />修改密码<br /></p></p>
