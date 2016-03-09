---
layout: post
title: 无光驱、无光盘成功安装Windows Vista /Server 2008 /Windows 7的简单方法(转)
date: 2009-03-27 09:16
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p><span style="color:red;"><span style="color:#000000;"><span style="color:#000000;"><font color="#ffcc00">1. 将准备安装的Windows Vista/Server 2008/Windows 7可启动光盘镜像ISO，解压到D盘根目录。</font></span></span></span></p>
<p><span style="color:red;"><span style="color:#000000;"><span style="color:#000000;">2. C盘如果安装的是Windows Vista/Server 2008/Windows 7系统，将&#8220;三个小文件&#8221;解压到C盘根目录，并将进入系统等待时间设置为30秒；C盘如果安装的是Windows XP系统，那么只需两个：zchzr.mbr和zchzr。但需修改C盘根目录隐藏文件boot.ini内容，<font color="#ffcc00">在最后加上C:zchzr.mbr="Vista Hard Disk Installer " 一行。</font></span></span></span></p>
<p><span style="color:red;"></span><span style="color:red;"><span style="color:#000000;">3. 重启动计算机，在选择菜单中确认&#8220;vista hdd installer&#8221;，即自动识别D盘存在系统安装文件并自行加载，可与光盘一样实现格式化安装。</span></span></p>
<p><span style="color:red;"><span style="color:#000000;">原文链接：<a href="http://hi.baidu.com/guoguo6688/blog/item/3d161f9703b5036555fb96eb.html" target="_blank">http://hi.baidu.com/guoguo6688/blog/item/3d161f9703b5036555fb96eb.html</a></span></span></p></p>
