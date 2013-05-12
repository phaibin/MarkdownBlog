---
layout: post
title: FTP上传的技巧
date: 2010-08-12 13:01
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>客户端如果发现不能登陆,看是否设置问题</p>
<p><font face="Verdana">问题出现原因：您使用的上传软件的FTP客户端程序不应该选用PASV mode和firewall setting<br />常用ftp工具被动模式的取消</font></p>
<p><font face="Verdana">a、FlashFxp取消被动模式 </font></p>
<p><font face="Verdana">在工具栏的 站点－站点管理器－要取消的站点 －选项－使用被动模式－去掉其前面的钩</font></p>
<p><font face="Verdana">b、CuteFtp取消被动模式 </font></p>
<p><font face="Verdana">站点管理器－要取消的站点－右键选择属性－类型－数据连接类型－使用 port－确定</font></p>
<p><font face="Verdana">c、LeapFtp取消被动模式 </font></p>
<p><font face="Verdana">在工具栏的 站点－站点管理器－要取消的站点－高级－使用pasv模式－去掉其前面的钩</font></p>
<p><font face="Verdana">提示426 Data connection closed？<br />这种情况可能是你所在网络安装了防火墙（或代理），该防火墙（或代理）禁止来自远程的连接，426 Data connection closed, transfer aborted表明了这一点。这时候你可以使用被动传输模式（PASV模式），来避免该限制，进行数据传输。<br />建议: 如果不使用PASV(即不使用被动传输)能够正常下载的话，就不要使用被动传输，因为主动传输比被动传输速度快（本站主机在主动传输时具备选择性确认的TCP选项（RFC2018)，能有效进行丢包重传,具备Timestamps选项（RFC1323）有效测定网络时延,避免提前重传），被动传输有时在用户开辟很多线程的时候会出现连接错误。</font></p></p>
