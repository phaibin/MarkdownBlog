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
1. 安装完后在/etc/rc.conf中添加:mysql_enable="YES", 重启, 这样以后就会自动启动。在/usr/local/etc/rc.d里的mysql-server.sh可以开启、关闭、重启mysql：sh mysql-server.sh start。当mysql开启后，运行netstat -a会看到多了一个*.3306端口。

2. 打mysql登陆服务器, 默认是空密码。
showdatabases; 显示存在的数据库
use mysql; 进入到mysql数据库
showtables; 显示现在的表
create table myuser (myname varchar(20), myid int); 创建一个表
drop table myuser; 删除表
create datebase wen; 建数据库
desc myuser; 显示myuser表的结构
3. /usr/local/bin下有一些mysql的管理工具
mysqladmin variables 显示服务器的信息
mysqldump wen>/tmp/wen.mysql 备份wen数据库
mysqldump wen</tmp/wen.mysql 恢复wen数据库

4. 更改登陆密码
mysqladmin -u root password 'wen' 回车提示输入密码
Enter password: 输入密码
这时再登陆会提示错误
必须用这种方式登陆: mysql -uroot -p
Enter password: 输入密码。


