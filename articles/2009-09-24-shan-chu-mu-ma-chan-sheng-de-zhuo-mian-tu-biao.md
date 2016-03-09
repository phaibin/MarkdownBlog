---
layout: post
title: 删除木马产生的桌面图标
date: 2009-09-24 16:05
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>不知道怎么中了招，桌面上出现了几个垃圾图标，有美女电影、flash小游戏等等，打开之后是IE程序，删也删不掉。在360网站上找到了解决办法：</p>  <p>运行regedit，删掉[HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindowsCurrentVersionExplorerDesktopNameSpace下数据为InternetExplorer的项，刷新一下桌面，那些图标就没有了。</p></p>
