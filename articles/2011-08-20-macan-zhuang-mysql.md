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
<p><p style="font: 12px Monaco; margin: 0;">1. <span style="font: 12px 'Heiti SC Light';">下载</span>MySQL 5.1<span style="font: 12px 'Heiti SC Light';">。选择合适的版本，比如这里选择的是</span>mysql-5.1.46-osx10.6-x86_64.dmg<span style="font: 12px 'Heiti SC Light';">。</span></p>
<p style="font: 12px Monaco; margin: 0;">2. <span style="font: 12px 'Heiti SC Light';">运行</span>dmg<span style="font: 12px 'Heiti SC Light';">，会发现里面有</span>4<span style="font: 12px 'Heiti SC Light';">个文件。首先点击安装</span>mysql-5.1.46-osx10.6-x86_64.pkg<span style="font: 12px 'Heiti SC Light';">，这是</span>MySQL<span style="font: 12px 'Heiti SC Light';">的主安装包。一般情况下，安装文件会自动把</span>MySQL<span style="font: 12px 'Heiti SC Light';">安装到</span>/usr/local<span style="font: 12px 'Heiti SC Light';">下的同名文件夹下。比如点击运行</span>“mysql-5.1.46-osx10.6-x86_64.dmg”<span style="font: 12px 'Heiti SC Light';">会把</span>MySQ<span style="font: 12px 'Heiti SC Light';">安装到</span>“/usr/local/mysql-5.1.46-osx10.6-x86_64”<span style="font: 12px 'Heiti SC Light';">中。一路默认安装完毕即可。</span></p>
<p style="font: 12px Monaco; margin: 0;">3. <span style="font: 12px 'Heiti SC Light';">点击安装第</span>2<span style="font: 12px 'Heiti SC Light';">个文件</span>MySQLStartupItem.pkg<span style="font: 12px 'Heiti SC Light';">，这样</span>MySQL<span style="font: 12px 'Heiti SC Light';">就会自动在开机时自动启动了。</span></p>
<p style="font: 12px 'Heiti SC Light'; margin: 0;"><span style="font: 12px Monaco;">4. </span>点击安装第<span style="font: 12px Monaco;">3</span>个文件<span style="font: 12px Monaco;">MySQL.prefPane</span>，这样就会在<span style="font: 12px Monaco;">“</span>系统设置偏好<span style="font: 12px Monaco;">”</span>中看到名为<span style="font: 12px Monaco;">“MySQL”</span>的<span style="font: 12px Monaco;">ICON</span>，通过它就可以设置<span style="font: 12px Monaco;">MySQL</span>开始还是停止，以及是否开机时自动运行。到这里<span style="font: 12px Monaco;">MySQL</span>就基本安装完毕了。</p>
<p style="font: 12px Monaco; margin: 0;">5. <span style="font: 12px 'Heiti SC Light';">通过运行</span>“sudo vi /etc/bashrc”<span style="font: 12px 'Heiti SC Light';">，在</span>bash<span style="font: 12px 'Heiti SC Light';">的配置文件中加入</span>mysql<span style="font: 12px 'Heiti SC Light';">和</span>mysqladmin<span style="font: 12px 'Heiti SC Light';">的别名</span></p>
<p style="font: 12px Monaco; margin: 0;">#mysql</p>
<p style="font: 12px Monaco; margin: 0;">alias mysql='/usr/local/mysql/bin/mysql'</p>
<p style="font: 12px Monaco; margin: 0;">alias mysqladmin='/usr/local/mysql/bin/mysqladmin'</p>
<p style="font: 12px 'Heiti SC Light'; margin: 0;">这样就可以在终端中比较简单地通过命令进行相应的操作，</p>
<p style="font: 12px Monaco; margin: 0;">6. <span style="font: 12px 'Heiti SC Light';">安装完毕之后</span>MySQL<span style="font: 12px 'Heiti SC Light';">的</span>root<span style="font: 12px 'Heiti SC Light';">默认密码为空，如果要设置密码可以在终端运行</span>“mysqladmin -u root password "mysqlpassword"”<span style="font: 12px 'Heiti SC Light';">来设置，其中</span>mysqlpassword<span style="font: 12px 'Heiti SC Light';">即</span>root<span style="font: 12px 'Heiti SC Light';">的密码。</span></p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';">7. 解决中文问题：</span></p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';">拷贝/usr/local/mysql/support-files下的任意一个*.cnf文件到/etc/my.cnf；在[client]下面添加：</span></p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';">default-character-set = utf8</span></p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';">在[mysqld]下面添加：</span></p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';"></span></p>
<p style="font: 12px Monaco; margin: 0;">default-storage-engine=INNODB</p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';"></span></p>
<p style="font: 12px Monaco; margin: 0;">character-set-server=utf8</p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';"></span></p>
<p style="font: 12px Monaco; margin: 0;">collation-server=utf8_general_ci</p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';"></span></p>
<p style="font: 12px Monaco; margin: 0;">8. 启动和停止的命令：</p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';"></span></p>
<p style="font: 12px Monaco; margin: 0;">sudo mysqld_safe</p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';"></span></p>
<p style="font: 12px Monaco; margin: 0;">sudo mysqladmin shutdown</p>
<p style="font: 12px Monaco; margin: 0;"><span style="font: 12px 'Heiti SC Light';"></span></p>
<p><span style="color: #333333; font-family: 宋体; font-size: 14px; line-height: 28px;">拷贝/usr/local/mysql/support-files下的任意一个*.cnf文件到/etc/my.cnf；</span></p></p>
