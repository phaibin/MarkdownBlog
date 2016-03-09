---
layout: post
title: 如何在 FreeBSD 同一片网硌卡加一个 ip 地址
date: 2005-08-11 00:30
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p>假设原先网络卡的 ip 是 211.211.211.211，想加一个 211.211.211.212，使用的是 rl0 这片网络卡，则做法如下.. <br /><br />1. 在 /etc/rc.conf 加上这一行 <br /><br />ifconfig_rl0_alias0=&quot;inet 211.211.211.212 netmask 255.255.255.255&quot; <br /><br />其中的 alias0 就是加装的第一个 ip，如要设定多个可在此修正，如 alias1、alias2.. aliasN <br /><br />2. 重新激活网络卡，执行 /etc/netstart <br /><br /># /etc/netstart br /&gt;</p>
