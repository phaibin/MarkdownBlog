---
title: 解除Mac迅雷对Safari的劫持
date: 2013-06-21 15:04
---
原文：<http://www.mac52ipod.cn/post/fuck-xunlei-thunder-for-mac.php>

Mac迅雷装完之后不能怎么配置，在Safari里面下载始终会打开迅雷，卸载Safari的迅雷插件之后也是一样。

解决办法就是删掉下面两个文件：

- ~/Library/Internet Plug-Ins/aThunderPlugIn.plugin
- /Applications/Thunder.app/Contents/BrowserPlugins/ThunderPlugIn.plugin

然后重启Safari。
