---
layout: post
title: 新建和显示文件
date: 2005-08-11 00:37
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><p>1.快速新建文件: echo 'sadf'&gt;1.txt<br /><br />2.在文件尾添加内容: echo 'asdf'&gt;&gt;1.txt<br /><br />3.显示文件内容: more 1.txt<br /><br />4.cat &gt; [檔名] 时，如果档案不存在，则会自动产生一个档案；如档案存在则会将档案清空.. <br /><br />cat &gt;&gt; [檔名]，档案不存在则自动建立此档，如存在则将所编辑的资料加在档案的最后.. <br /><br />举个例子，如我们要编辑 /etc/mail/access 这个是 sendmail 的 relay 设定档.. <br /><br />想在这个档案中加入 192.168.88.5 relay <br /><br />则可用此方法(假设 access 档案已存在，故使用 cat &gt;&gt; .. 的方法) .. <br /><br /># cat &gt;&gt; /etc/mail/access <br />192.168.88.5 RELAY <br />按 ctrl+d 存盘 <br /><br />如此则可将 192.168.88.5 relay 加到 access 的最后一行..</p><br /></p>
