---
layout: post
title: 彻底解决Windows7 狂读硬盘的问题(转载)
date: 2009-06-08 17:33
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>使用Microsoft Windows 7 的时候遇到过系统狂读硬盘、硬盘灯狂闪的情况,可以试试下面的方法:<br />1. 关闭Volume Shadow Copy服务，在Vista里很多文件、文件夹看属性里都有一个 早期版本 选项，我想这个功能对绝大多数人都没有用吧？Win+R打开services.msc ，找到Volume Shadow Copy，设置为禁用。</p> <p>2. 关闭所有分区的系统还原：在我的电脑 属性 高级里关闭所有分区的系统还原。</p> <p>3. 关闭所有分区的 磁盘清理 计划任务，在盘符上点属性，找到磁盘整理，把“计划磁盘整理”的钩去掉</p> <p>4. 关闭包含大块文件的文件压缩和索引，在盘符/文件夹上点右键，取消 索引文件以加快搜索速度，在文件夹上点右键，属性，高级，关闭“压缩文件以节省空间”“索引文件以加快搜索速度”。</p> <p>5. 关闭Windows Search服务。</p> <p>6.关闭Superfetch服务</p></p>
