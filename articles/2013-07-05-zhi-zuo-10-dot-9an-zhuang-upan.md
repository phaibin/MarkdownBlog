---
title: 制作10.9安装U盘
date: 2013-07-05 09:49
---
原文：<http://bbs.weiphone.com/read-htm-tid-6550442.html>

把OS X Install ESD里面的BaseSystem.dmg恢复到U盘，然后把OS X Install ESD里面的Packages文件夹直接拷贝到U盘的System/Installation下面（原目录下有个Packages的快捷方式，把它删了才能拷贝）。

另外虚拟机安装只能先安装10.8，然后升级到10.9。在我的Parallels里面升级10.9，拷贝完文件，重启之后，就一直就不了系统，升级了Parallels也不行。后来看到一个人的解释，需要把虚拟机的显存设为128M，然后重启，果然就进去了。

