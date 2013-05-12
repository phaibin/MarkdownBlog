---
layout: post
title: Lion中连续输入的方法
date: 2011-09-02 06:49
categories:
- Mac
tags:
- lion
published: true
comments: true
---
<p><p>今天突然发现几乎在所有输入文字的地方都不可以连续输入，按住一个字母，要么会弹出一个选择元音的框，要么没反应。原来没有注意过这个问题，不知道是不是从Lion才开始的。解决方法是，在终端中输入：</p>
<p>defaults write -g ApplePressAndHoldEnabled -bool false</p>
<p>想要恢复输入：</p>
<p>defaults write -g ApplePressAndHoldEnabled -bool true</p></p>
