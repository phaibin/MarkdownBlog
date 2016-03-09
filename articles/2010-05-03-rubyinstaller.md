---
layout: post
title: RubyInstaller
date: 2010-05-03 18:46
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>Ruby官方下载的Windows版本只有1.8.6是安装包，其他版本都是解压的，没有建立rb文件的关联和修改环境变量等功能。今天才发现在ruby官方网点还提供了另外一种下载方式：RubyInstaller（<a title="http://rubyinstaller.org/" href="http://rubyinstaller.org/">http://rubyinstaller.org/</a>）</p>  <p>这里面包含了Ruby1.8.7和1.9.1的安装包，还有一个Development Kit包含了独立的MinGW工具，可以用来编译生成自己的gem。</p>  <p>Development Kit的安装方法是：把解压的文件夹放到Ruby安装目录里，然后修改devkit/msys/1.0.11/etc/fstab里面的Ruby路径为自己的路径。</p>  <p>我安装了<a href="http://rubyforge.org/frs/download.php/69034/rubyinstaller-1.8.7-p249-rc2.exe">Ruby 1.8.7-p249 (RC2)</a>，然后ruby-debug和ruby-debug-ide都是编译安装的，经测试都是可以用的。</p>  <p>不过安装Sql server adapter的时候出了点问题，总是提示找不到ODBC，解决方法就是在<a href="http://www.ch-werner.de/rubyodbc">http://www.ch-werner.de/rubyodbc</a>上下载i386-msvcrt-ruby-odbc.zip，把解压后的odbc.so和odbc_utf8.so文件复制到Ruby安装目录libruby1.8i386-mingw32目录下。</p></p>
