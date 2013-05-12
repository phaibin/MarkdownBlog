---
layout: post
title: 有关系统的一些激活问题..
date: 2005-08-11 00:30
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><div class="diaryContent" id="diary1007315">有时，会修改 FreeBSD 的一些设定，如一些网络参数、软件的 .conf 设定，或是 /etc/r.conf 檔，那么如何让设定值生效，是否一定要重新开机呢？ <br /><br />这可分为三方面来说.. <br /><br />1. 网络相关设定，如网络适配卡、hostname .. 等，只要执行以下指令就可以重新加载你的网络设定.. <br /><br /># sh /etc/netstart <br /><br />netstart 是一个 script 档案，执行时会去参考 /etc/rc.network。因此只要执行这个指令就能够重新激活网络设定.. <br /><br />有兴趣者可参考一下 netstart 及 rc.network 这二个档的内容，研究看看到底做了些什么东东.. <br /><br />2. 修改了 rc.conf 中其它的设定 <br /><br />可参考以下三个 step 来做.. <br /><br />. 进入单人模式 <br /># shutdown now <br /><br />. 选择 sh，造内定值即可，即 /bin/sh <br /><br />. 离开单人模式 <br /># exit <br /><br />这样就会重新激活系统了.. <br /><br />3. 软件的设定，如一些 *.conf 檔，像是修正了 apache sendmail .. 等 <br /><br />通常在 /etc/local/rc.d/ 这个目录中会有相关的 .sh 檔，直接执行就可以了，注意的是一般要加上参数，一般的参数有以下(视软件而定会有不同).. <br /><br />start 激活 <br />stop 停止 <br />reload 或 restart 重新激活 <br /><br />第二种方法就是直接使用 killall，如我们要重新激活 inetd，可用以下方法: <br /><br /># killall -1 inetd <br /><br />或是 <br /><br /># killall -HUP inetd <br /><br />这样就可以重新激活这个 daemon 了 <br /></div></p>
