---
title: 'OS X 10.11 El Capitan制作启动U盘'
date: '2016-01-26 15:20'
tags: [macos]
---
1. 从Mac App Store下载OS X EL Capitan

1. 把U盘格式化为OS X扩展（日志式），名字改为“OS X El Capitan”

1. 命令行运行：

    sudo /Applications/Install\ OS\ X\ El Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/OS X El Capitan --applicationpath /Applications/Install\ OS\ X\ El Capitan.app --nointeraction
