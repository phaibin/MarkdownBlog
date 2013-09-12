---
layout: post
title: Mac安装MySQL
date: 2011-08-20 14:03
categories:
- Mac
tags: []
published: true
comments: true
---
1. 下载MySQL 5.1。选择合适的版本，比如这里选择的是mysql-5.1.46-osx10.6-x86_64.dmg。
2. 运行dmg，会发现里面有4个文件。首先点击安装mysql-5.1.46-osx10.6-x86_64.pkg，这是MySQL的主安装包。一般情况下，安装文件会自动把MySQL安装到/usr/local下的同名文件夹下。比如点击运行“mysql-5.1.46-osx10.6-x86_64.dmg”会把MySQ安装到“/usr/local/mysql-5.1.46-osx10.6-x86_64”中。一路默认安装完毕即可。
3. 点击安装第2个文件MySQLStartupItem.pkg，这样MySQL就会自动在开机时自动启动了。
4. 点击安装第3个文件MySQL.prefPane，这样就会在“系统设置偏好”中看到名为“MySQL”的ICON，通过它就可以设置MySQL开始还是停止，以及是否开机时自动运行。到这里MySQL就基本安装完毕了。
5. 通过运行“sudo vi /etc/bashrc”，在bash的配置文件中加入mysql和mysqladmin的别名

        #mysql
        alias mysql='/usr/local/mysql/bin/mysql'
        alias mysqladmin='/usr/local/mysql/bin/mysqladmin'

    这样就可以在终端中比较简单地通过命令进行相应的操作
6. 安装完毕之后MySQL的root默认密码为空，如果要设置密码可以在终端运行“mysqladmin -u root password "mysqlpassword"”来设置，其中mysqlpassword即root的密码。
7. 解决中文问题：
拷贝/usr/local/mysql/support-files下的任意一个*.cnf文件到/etc/my.cnf；在[client]下面添加：

        default-character-set = utf8
        在[mysqld]下面添加：
        default-storage-engine=INNODB
        character-set-server=utf8
        collation-server=utf8_general_ci

8. 启动和停止的命令：

        sudo mysqld_safe
        sudo mysqladmin shutdown
        
拷贝/usr/local/mysql/support-files下的任意一个*.cnf文件到/etc/my.cnf；