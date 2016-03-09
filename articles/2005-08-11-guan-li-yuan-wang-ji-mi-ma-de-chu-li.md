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
reboot  
重启  
启动到Loading Kernel的时候,按空格,出现ok提示符  
boot -s  
以单用户的形式启动  
fsck -y  
检查文件系统的完整性  
mount -a  
挂载所有的文件系统  
passwd  
修改密码 

