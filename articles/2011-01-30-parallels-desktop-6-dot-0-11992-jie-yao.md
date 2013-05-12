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
<p><p style="font:14px 'STHeiti Light';margin:0;">1. 在 /etc/host 内加入:</p>
<p style="font:14px 'STHeiti Light';margin:0;">127.0.0.1 parallels.com</p>
<p style="font:14px 'STHeiti Light';margin:0;">127.0.0.1 registration.parallels.com</p>
<p style="font:14px 'STHeiti Light';margin:0;">127.0.0.1 update.parallels.com</p>
<p style="font:14px 'STHeiti Light';margin:0;">127.0.1.1 pd6.blist.parallels.com</p>
<p style="font:14px 'STHeiti Light';margin:0;"> </p>
<p style="font:14px 'STHeiti Light';margin:0;">2. 打开终端输入:</p>
<p style="font:14px 'STHeiti Light';margin:0;">dscacheutil -flushcache</p>
<p style="font:14px 'STHeiti Light';margin:0;">清空dns记录</p>
<p style="font:14px 'STHeiti Light';margin:0;"> </p>
<p style="font:14px 'STHeiti Light';margin:0;">3.使用终端输入如下:</p>
<p style="font:14px 'STHeiti Light';margin:0;">rm -rfd /Users/~You~/Library/Preferences/com.parallels*</p>
<p style="font:14px 'STHeiti Light';margin:0;">rm -rfd /Users/~You~/Library/Preferences/Parallels/*</p>
<p style="font:14px 'STHeiti Light';margin:0;">rm -rfd /Users/~You~/Library/Preferences/Parallels</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/var/db/Parallels/Stats/*</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/var/db/Parallels/Stats</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/var/db/Parallels</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /Library/Logs/parallels.log</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /Library/Preferences/Parallels/*</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /Library/Preferences/Parallels</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/var/db/Parallels</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/var/.Parallels_swap</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/var/db/receipts/'com.parallels*'</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/tmp/qtsingleapp-*-lockfile</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/tmp/com.apple.installer*/*</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/tmp/com.apple.installer*</p>
<p style="font:14px 'STHeiti Light';margin:0;">sudo -s rm -rfd /private/var/root/Library/Preferences/com.parallels.desktop.plist</p>
<p style="font:14px 'STHeiti Light';margin:0;"> </p>
<p style="font:14px 'STHeiti Light';margin:0;">4.安装11992后断网。</p>
<p style="font:14px 'STHeiti Light';margin:0;">运行Parallels Desktop 后输入如下序列号：</p>
<p style="font:14px 'STHeiti Light';margin:0;">N9N4PQ-G3XFTK-6G7A74-AKAD14-QKXNXJ</p>
<p style="font:14px 'STHeiti Light';margin:0;"> </p>
<p style="font:14px 'STHeiti Light';margin:0;"> </p>
<p style="font:14px 'STHeiti Light';margin:0;">如果不成功请重新来一次</p></p>
