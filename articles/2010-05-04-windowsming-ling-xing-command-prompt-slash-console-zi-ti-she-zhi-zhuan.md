---
layout: post
title: windows命令行(Command Prompt / Console)字体设置(转）
date: 2010-05-04 13:08
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>原文：<a title="http://www.2maomao.com/blog/windows-console-font/" href="http://www.2maomao.com/blog/windows-console-font/">http://www.2maomao.com/blog/windows-console-font/</a></p>  <p>Windows命令行的字体一直让我不爽，只有两个选项，英文版还有个Lucida Console比较好看，切换到中文版以后，就只有很让人抓狂的Fixedsys和新宋体，唉，现在只要是可以输入的地方，哪有不让改字体的。</p>  <p>今天搜了一下，英文系统下，通过改注册表是可以做到的：   <br /><a href="http://www.orablogs.com/duffblog/archives/001209.html">http://www.orablogs.com/duffblog/archives/001209.html</a>    <br /><a href="http://support.microsoft.com/kb/247815">http://support.microsoft.com/kb/247815</a></p>  <p>但是中文系统下仍然不行，我先切换到英文系统，然后搞了几个快捷方式再切回来，试了几次总算成功了。</p>  <p>这里有张截图，其中用的是Bitstream Vera Sans Mono字体：   <br /><img alt="console_font_veramono.gif" src="http://www.2maomao.com/blog/wp-content/uploads/console_font_veramono.gif" /></p>  <p>为了以后方便，我做了一个包，按照说明安装之后重启机器，就可以在中英文系统上用了。   <br /><strong>在这儿下载</strong>：    <br /><a href="http://www.2maomao.com/blog/wp-content/uploads/win_console_fonts.zip">http://www.2maomao.com/blog/wp-content/uploads/win_console_fonts.zip</a></p>  <p><strong>压缩包里面包含</strong>了：    <br />—— Lucida Console和Bitstream Vera Sans Mono字体    <br />（参见我以前的文章：<a href="http://www.2maomao.com/blog/best-programmer-fonts/">程序员最喜欢用的编程字体</a>）</p>  <p>—— 修改好的注册表项：console_font_setting.reg</p>  <p>—— 一些配置好字体的命令行快捷方式，包括Courier New / Lucida Console / Consolas / Bitstream Vera Sans Mono</p>  <p><strong>使用方式</strong>：    <br />1. 下载，解压，先随便找个地方放一下    <br />2. 导入注册表：双击console_font_setting.reg导入注册表    <br />3. 安装字体：把ttf文件全部安装到c:windowsfont 目录下    <br />4. <strong>重启系统</strong>（必须），把四个快捷方式打开看看。</p>  <p>然后嘛，就看你自己做什么了，修改一下那些快捷方式里面的属性一般就够用了。</p></p>
