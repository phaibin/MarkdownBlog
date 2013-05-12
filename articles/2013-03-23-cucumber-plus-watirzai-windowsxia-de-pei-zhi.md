---
layout: post
title: cucumber+watir在windows下的配置
date: 2013-03-23 23:16
categories:
- RoR
tags: []
published: true
comments: true
---
1. 下载rubyinstaller安装，地址是：<http://rubyinstaller.org/downloads/>。版本最好是1.9.3。安装时使用默认的目录就可以了，记得勾选加入path的选项。

    ![Ruby installer](http://phaibin.tk/wp-content/uploads/2013/03/ruby_installer.png)

2. 安装DevKit，DevKit在编译gem的时候需要用到。下载地址跟上面一样，下载这个文件：DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe。下载完之后解压到C:\DevKit下面。当然这个目录是随意的，放到C盘只是为了省事。然后进入命令行切换到C:\DevKit下面。运行两个命令：

		ruby dk.rb init
		ruby dk.rb install
更多DevKit的介绍在这里：<https://github.com/oneclick/rubyinstaller/wiki/Development-Kit>。

3. 在命令行下面运行：

		gem install bundle
bundle可以更多方便地管理gem

4. 到<http://code.google.com/p/selenium/downloads/list>下载IEDriverServer，这个是用来驱动IE的工具，可以让cucumber的脚本在IE中运行。如果使用Firefox来运行脚本可以不需要下载这个。下载完之后放到一个path覆盖的目录，比如C:\Windows。

5. 建立一个目录作为项目目录，里面的结构为：

    ![Cucumber](http://phaibin.tk/wp-content/uploads/2013/03/cucumber.png)
    
    目录下面有一个features目录，用来放cucumber脚本，features下面有一个step_definations目录，放置step文件。根目录建立一个Gemfile文件，里面加入需要安装的插件：

		source "http://ruby.taobao.org"
		gem 'cucumber'
		gem 'watir'

6. 从命令行切换到项目目录下面，运行bundle，这样会把cucumber和watir都装上。

7. 然后就可以在命令行输入：cucumber features/tset.feature 来运行自动化测试了。
