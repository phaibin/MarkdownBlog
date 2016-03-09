---
layout: post
title: FreeBSD的技巧
date: 2006-01-13 11:34
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><p><font face="Courier New">查看服务器的80端口的连接数<br />netstat -nat|grep -i &quot;80&quot;|wc -l</font></p><p><font face="Courier New">用下面命令察看哪些服务在运行<br />netstat -na --ip<br />netstat -na |grep LIST<br />lsof -i:端口</font></p><p><font face="Courier New">查看软件安装的位置<br />&nbsp;pkg_info &ndash;L *** | less<br /></font></p><p><font face="Courier New">查看这个软件的具体信息<br />&nbsp;pkg_info ***</font></p><p><font face="Courier New">安装lsof程序时需要<br />install&nbsp; /quark/qwqg/lsof_4.59/lsof /usr/sbin/lsof<br />source /root/.cshrc</font></p><p><font face="Courier New">将man 命令的输入结果导入到TXT文件中<br />man | col -b &gt; file.txt</font></p><p><font face="Courier New"></font></p><p><font face="Courier New">在bge0网卡上增加ip别名：<br />ifconfig bge0 add alias 192.168.64.80&nbsp; netmask 255.255.255.255 up&nbsp; </font></p><p><font face="Courier New">在bge0网卡上删除ip别名：<br />ifconfig bge0 -alias 192.168.64.80</font></p><p><font face="Courier New">说明：这里掩码的设定是这样的，同一个网段的第一个ip掩码按照真实的掩码设置。在这个网段下面再增加ip时，掩码就是255.255.255.255了</font></p><p><font face="Courier New">查看多少个独立IP访问网站<br />netstat -an |grep tcp |awk '{print $5}' |awk -F: '{print $1}' |sort |uniq |wc -l</font></p><p><font face="Courier New">下面命令可以分别计算当前目录下的文件和目录个数：<br />ll * |grep &quot;^-&quot;|wc -l&nbsp;----- to count files <br />ll * |grep &quot;^d&quot;|wc -l&nbsp;----- to count dir</font></p><p><font face="Courier New">只列子目录<br />ll -F | grep /$ </font></p><p><font face="Courier New">在当前目录下搜索文件内带system的关键字<br />grep -r system * <br /></font><font face="Courier New"></font></p><p><font face="Courier New">在vi中替换字符的命令:<br />:g/abc/s//def/</font></p><p>如何从一个大tgz包中解压出某个文件<br />gunzip -dc file.tar.gz | tar tf - <br />可以看包里面的文件<br />然后用<br />gunzip -dc file.tar.gz | tar xf - file1 file2<br />其中file1 file2是你要解出来的文件。这个方法因为用的是stdout和pipe, 不需要占用多少的临时磁盘空间。 </p><p>在系统上查看用户php程序执行时间长短;正常执行时间为0.1s<br />date ; php -f index.php date</p></p>
