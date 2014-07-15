---
title: "老款MacBookPro用U盘安装boot camp"
date: 2014-07-14 16:39
---
参考：<http://bbs.feng.com/read-htm-tid-7828314.html>

老款的MacBookPro在安装boot camp的时候会提示需要内置光驱，不能用U盘来安装WIN7。解决的办法就是破解boot camp程序。

定位Boot Camp助理，显示包内容，讲Contents/info.plist复制出来，编辑：

1. 在DARequiredROMVersions下面添加Boot ROM版本号，Boot ROM的信息从下面获取

    ![Boot Rom](/images/articles/bootrom.png)

1. 在PreUSBBootSupportedModels下面添加型号标示符，比如MBA61

1. 修改PreUSBBootSupportedModels为USBBootSupportedModels

1. 运行sudo codesign -fs - /Applications/Utilities/Boot\ Camp\ Assistant.app/

这样破解完boot camp之后可以做U盘来安装了，但是装WIN7的时候又出现了另外一个问题。

我有两块硬盘，原装的机械硬盘没有动，SSD在光驱位。Mac装在了SSD里面，现在我想把WIN7安装在机械硬盘上面。在选择硬盘格式化之后，点下一步，提示“0x80300024”。搜索了之后发现原因就是因为有两块硬盘，应该是WIN7的缺陷造成的。用了几种方法都没有解决，最后不得不用一个比较笨的办法：先把SSD的排线拔掉，开机安装好WIN7之后再把SSD的排线插回去。不过首先要保证安装WIN7的硬盘在主位。