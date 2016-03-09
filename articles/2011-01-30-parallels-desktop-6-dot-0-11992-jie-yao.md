---
layout: post
title: Parallels Desktop 6.0.11992 解药
date: 2011-01-30 15:19
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
1. 在 /etc/host 内加入:

        127.0.0.1 parallels.com
        127.0.0.1 registration.parallels.com
        127.0.0.1 update.parallels.com
        127.0.1.1 pd6.blist.parallels.com
 
2. 打开终端输入:

        dscacheutil -flushcache
清空dns记录
 
3. 使用终端输入如下:

        rm -rfd /Users/~You~/Library/Preferences/com.parallels*
        rm -rfd /Users/~You~/Library/Preferences/Parallels/*
        rm -rfd /Users/~You~/Library/Preferences/Parallels
        sudo -s rm -rfd /private/var/db/Parallels/Stats/*
        sudo -s rm -rfd /private/var/db/Parallels/Stats
        sudo -s rm -rfd /private/var/db/Parallels
        sudo -s rm -rfd /Library/Logs/parallels.log
        sudo -s rm -rfd /Library/Preferences/Parallels/*
        sudo -s rm -rfd /Library/Preferences/Parallels
        sudo -s rm -rfd /private/var/db/Parallels
        sudo -s rm -rfd /private/var/.Parallels_swap
        sudo -s rm -rfd /private/var/db/receipts/'com.parallels*'
        sudo -s rm -rfd /private/tmp/qtsingleapp-*-lockfile
        sudo -s rm -rfd /private/tmp/com.apple.installer*/*
        sudo -s rm -rfd /private/tmp/com.apple.installer*
        sudo -s rm -rfd /private/var/root/Library/Preferences/com.parallels.desktop.plist

4. 安装11992后断网。

运行Parallels Desktop 后输入如下序列号：
N9N4PQ-G3XFTK-6G7A74-AKAD14-QKXNXJ
 
如果不成功请重新来一次