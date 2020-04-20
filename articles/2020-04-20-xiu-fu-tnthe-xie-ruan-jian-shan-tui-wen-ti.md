---
title: 修复TNT和谐软件闪退问题
date: 2020-04-20 10:48
---
原文：<https://xclient.info/a/e66ab41a-62a9-cbe6-656c-f818044cd738.html>

因为Apple苹果公司删除了TNT的证书，所以在2019年7月12日后软件都不能运行了，临时的解决办法，就是自己签名，具体往下看。

1. 安装Xcode
1. 在命令行运行：`codesign --force --deep --sign - /Applications/name.app`