---
layout: post
title: Drupal安装过程
date: 2006-04-28 13:25
categories:
- 网页
tags: []
published: true
comments: true
---
<p><p>Apache/2.0.55 PHP/4.42 MySQL/4.1.18 drupal/4.6.6</p><p>1.Apache是安装包，更改几个位置：<br />DocumentRoot&nbsp;DirectoryIndex<br />在DocumentRoot下面的一个Directory也要改<br />虚拟目录<br />Alias /music &quot;G:/mp3&quot;<br />&lt;Directory &quot;G:/mp3&quot;&gt;<br />&nbsp;&nbsp;&nbsp; Options Indexes MultiViews<br />&nbsp;&nbsp;&nbsp; IndexOptions FancyIndexing ScanHTMLTitles NameWidth=128 DescriptionWidth=256 HTMLTable VersionSort FoldersFirst<br />&nbsp;&nbsp;&nbsp; AllowOverride None<br />&nbsp;&nbsp;&nbsp; Order allow,deny<br />&nbsp;&nbsp;&nbsp; Allow from all<br />&lt;/Directory&gt;</p><p>IndexOptions FancyIndexing ScanHTMLTitles NameWidth=128 DescriptionWidth=256 HTMLTable VersionSort FoldersFirst这行是指定排列的方式</p><p>2.PHP是压缩包，解压，把php4ts.dll拷到system32下，在apache的配置文件最下面加上：</p><p># For PHP 4 do something like this:<br />LoadModule php4_module &quot;D:/php-4.4.2-Win32/sapi/php4apache2.dll&quot;<br />AddType application/x-httpd-php .php</p><p># configure the path to php.ini<br />PHPIniDir &quot;D:/php-4.4.2-Win32&quot;</p><p>在php目录下面把 php.ini-recommended 复制为 php.ini，更改几个位置：<br />extension_dir<br />把gd2和mysql的extension打开</p><p>有几个地方是drupal的要求，还不确定是否有必要<br />memory_limit = 12M<br />session.save_handler = user</p><p>还有一个是自己想的，觉得有必要改<br />include_path = &quot;.;D:/php-4.4.2-Win32/PEAR&quot;</p><p>3.MySQL安装完后，配置一下服务器<br />在装Drupal的时候会提示出错&ldquo;Client does not support authentication protocol requested by server; consider upgrading MySQL client&rdquo;，这时候要把MySQL配置一下，在MySQL的提示符下输入：<br />SET PASSWORD FOR <a href="mailto:'root'@'localhost'">'root'@'localhost'</a> = OLD_PASSWORD('wen');</p><p>4.安装Drupal</p><p>解压，建立数据库drupal，执行database/database.mysql脚本，更改sites/default/settings.php里的设置</p><p>$db_url = 'mysql://root:wen@localhost/drupal';<br />$base_url = 'http://localhost';&nbsp; //4.6修改，4.7不改</p><p>打开地址<a href="http://localhost">http://localhost</a>，先注册一个用户作为管理员，然后登陆，修改密码</p><p><br />5.汉化</p><p>在administer/modules里启用locale，菜单会增加localization，导入语言包，语言列表(list)中将中文语言包设置为可用(Enabled)和默认(Default),保存。</p><p></p><p><br /></p></p>
