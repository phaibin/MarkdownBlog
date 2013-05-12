---
layout: post
title: 关于VMWare出现“cannot find a valid peer process to connect to”错误的解决方案（转）
date: 2009-05-31 10:49
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>1、用process explorer杀掉vmware-vmx.exe进程（如果有的话）<br />2、清除虚拟机目录下的.lck文件<br />3、在dos命令行下执行net start vmx86，以启动peer process</p></p>
