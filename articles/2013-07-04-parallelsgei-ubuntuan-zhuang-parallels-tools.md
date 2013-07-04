---
title: Parallels给Ubuntu安装Parallels Tools
date: 2013-07-04 13:37
---
我安装的Parallels是8.0.18354版本的，这是能找到的最新的xx版，但是并不是官方的最新版。在装完Ubuntu 13.04虚拟机之后，安装Parallels Tools的时候报错，无法安装。搜索了很多解决办法都不行，但是其中一个网页给了我启发。

那个人在Parallels 7里面安装12.04，装不上Parallels Tools，然后等他升级到了Parallels 8之后，自然就好了。说明新版的Parallels Tools修复了对Ubuntu的支持。

根据这个思路，我下载了官方最新的Parallels，然后从安装包里面剥离出Parallels Tools的dmg，发现大小不一样，说明真的升了级。然后把最新的Parallels Tools替换到本地来，重新安装，一路顺畅。装完之后Ubuntu变的流畅多了。

Parallels Tools在本地的路径是：`/Applications/Parallels Desktop.app/Contents/Resources/Tools/prl-tools-lin.iso`，安装文件里面的位置是：`/Volumes/Parallels Desktop 8/Parallels Desktop.app/Contents/Resources/Tools/prl-tools-lin.iso`