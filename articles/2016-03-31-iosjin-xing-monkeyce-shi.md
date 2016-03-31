---
title: iOS进行Monkey测试
date: 2016-03-31 10:57
---
参考：<https://github.com/vigossjjj/CrashMonkey4IOS>
<https://github.com/jonathanpenn/ui-auto-monkey>

Monkey Test是Android里面的一种压力测试方法，有人把它也引进入了iOS里面。

首先参照<https://github.com/jonathanpenn/ui-auto-monkey>里面的说明来手动运行。打开项目，选择Product->Profile。然后选择“UI Automation”。在Script中把UIAutoMonkey.js里面的内容粘贴进去。点击运行就可以了。

模拟器应该很容易就可以跑了，真机碰到了一点问题。如果真机不能选择Target，就把手机或者电脑重启一下，虽然很傻，还真的管用。另外，需要把手机Developer里面的"Enabel UI Automation"选型打开，不然脚本没法运行。

如果手动运行没问题了，就可以参考<https://github.com/vigossjjj/CrashMonkey4IOS>里面的方法在命令行下面运行。CrashMonkey4IOS很强大，帮你做了很多工作，可以截图，收集崩溃日志，还有测试报告。