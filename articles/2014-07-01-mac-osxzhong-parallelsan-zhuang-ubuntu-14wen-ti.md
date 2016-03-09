---
title: MAC OSX中Parallels安装Ubuntu 14问题
date: 2014-07-01 19:53
---
参考：<http://www.qinbin.me/mac-osx中parallels安装ubuntu-14问题/>

<http://kb.parallels.com/en/121300>

MAC OSX中Parallels安装Ubuntu 14后再安装Parallels Tools会发现只能显示空的桌面，其他的任务栏啥都没有了，解决办法如下：

    ls -l /etc/X11/
    vi /etc/X11/xorg.conf.XXXXXXXX 
    sudo mv /etc/X11/xorg.conf.XXXXXXXX /usr/share/X11/xorg.conf.d/xorg.conf
    export DISPLAY=:0
    gsettings reset org.compiz.core:/org/compiz/profiles/unity/plugins/core/ active-plugins

然后重启。

备注：Fn+Ctl+Alt+Cmd+F2可以进入命令行模式，Fn+Ctl+Alt+Cmd+F7可以结束命令行模式。


