---
layout: post
title: MYSQL配置
date: 2005-08-11 00:37
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><p>1.安装完后在/etc/rc.conf中添加:mysql_enable=&quot;YES&quot;, 重启, 这样以后就会自动启动。在/usr/local/etc/rc.d里的mysql-server.sh可以开启、关闭、重启mysql：sh mysql-server.sh start。当mysql开启后，运行netstat -a会看到多了一个*.3306端口。<br />2.打mysql登陆服务器, 默认是空密码。<br />showdatabases; 显示存在的数据库<br />use mysql; 进入到mysql数据库<br />showtables; 显示现在的表<br />create table myuser (myname varchar(20), myid int); 创建一个表<br />drop table myuser; 删除表<br />create datebase wen; 建数据库<br />desc myuser; 显示myuser表的结构<br />3./usr/local/bin下有一些mysql的管理工具<br />mysqladmin variables 显示服务器的信息<br />mysqldump wen&gt;/tmp/wen.mysql 备份wen数据库<br />mysqldump wen&lt;/tmp/wen.mysql 恢复wen数据库<br />4.更改登陆密码<br />mysqladmin -u root password 'wen' 回车提示输入密码<br />Enter password: 输入密码<br />这时再登陆会提示错误<br />必须用这种方式登陆: mysql -uroot -p<br />Enter password: 输入密码。<br /></p></p>
