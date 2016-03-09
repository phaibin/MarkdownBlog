---
layout: post
title: 神奇的Watir
date: 2009-06-15 22:04
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>妈呀，还没见过这么神奇的东西，自动打开IE窗口，输入一串文字，自动点击按钮，一切就像电影中智能计算机的行为。这就是Watir。我从《Every Scripting with Ruby》中了解到它，一个用来进行端到端测试（end-to-end tests）的工具。现在最新版为1.6.2，安装方法：<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gem install watir<br />这个版貌似有点问题，装完要做些小修改。首先把windows-pr卸载重新安装一遍，然后代码不能写include Watir，要用Watir::IE的形式，不然会提示找不到safariwatir。网址<a title="http://wtr.rubyforge.org/" href="http://wtr.rubyforge.org/">http://wtr.rubyforge.org/</a>。</p> <p>一个Watir的例子（来源于《Every Scripting with Ruby》）：</p> <p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/Watir_1365E/image_6.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/Watir_1365E/image_thumb_2.png" width="587" height="400" /></a></p></p>
