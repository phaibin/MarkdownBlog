---
layout: post
title: FireFox如何在Windows下运行多个程序实例
date: 2008-09-27 13:09
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><div>来源：MozillaZine 232176 (http://forums.mozillazine.org/viewtopic.php?t=232176)&#160;</div>
<div>您能用Firefox做到，但是您必须用两个不同的配置。&#160;</div>
<div>用配置管理器建立一个新配置。&#160;</div>
<div>建立一个文本文件，在里面放入下面的代码：&#160;</div>
<div>代码:&#160;</div>
<div>@echo off&#160;</div>
<div>set MOZ_NO_REMOTE=1&#160;</div>
<div>start "" "C:program filesMozilla Firefoxfirefox.exe" -p "新配置名称"&#160;</div>
<p>将文件保存为&#8220;Firefox.bat&#8221; 。</p>
<p>用您常用的配置启动 Firefox。执行批处理文件，起动使用新配置的第二个 Firefox 实例。</p>
<p>启动配置管理器的方法：关闭所有FireFox窗口，运行<span style="color:#4b4742;font-family:'Courier New';font-size:14px;">firefox.exe -ProfileManager。<span style="color:#000000;font-family:Simsun;font-size:16px;">&#160;</span></span></p></p>
