---
title: 7700K+Z270安装High Sierra
date: 2017-11-07 14:28
---
研究黑苹果最专业的网站：<https://www.tonymacx86.com>

装黑苹果最重要的事情是选好配件，所以tonymacx86上面有专门的"Buyer's Guide"。这个Guide每个月都会更新，不过最近的变化都不大，最推荐的配置始终是7代酷睿和Z270d主板，支持最好的主板牌子是技嘉。显卡已经支持Pascal，所以基本可以随便买。

tonymacx86里面有一篇通用的安装High Sierra的步骤：<https://www.tonymacx86.com/threads/unibeast-install-macos-high-sierra-on-any-supported-intel-based-pc.235474/>。这篇虽然简单，而且基本不可能不碰到别的问题，但是基本的步骤都是这么做的。

1. 首先在一台可以用的Mac上面下载High Sierra的安装包，然后使用tonymacx86提供的USB工具UniBeast来制作安装USB。UniBeast的最新版本是8.0，已经支持High Sierra，制作过程很简单，没有几个选项。

1. 调整BIOS设置，最主要的是关闭VT-d，关闭iGPU

1. 接下来我参考了一篇更好的安装文档：<http://hackintosher.com/guides/high-sierra-install-full-guide/>。

1. 使用USB启动，进入安装界面，把硬盘格式化为"Mac OS Extended (Journaled)"。不要选择APFS，目前APFS的支持还不好，容易碰到奇怪的问题。继续安装。

1. 第一次重启之后仍然选择用U盘来安装，然后进入命令行，禁止APFS转换

1. 重启选择硬盘启动，等安装完之后，用"Clover Configurator"打开硬盘的EFI分区，把U盘的EFI分区copy过去覆盖。记得删掉APPLE目录。

1. 按照这篇<http://hackintosher.com/guides/properly-install-nvidia-drivers-high-sierra-10-13/>安装Nvidia web driver

1. 按照这篇<http://hackintosher.com/guides/get-kabylake-hackintosh-audio-working/#step3>安装声卡驱动。如果修改所有的Inject值都不好使，用Clover Configurator编辑Clover的config，勾选"FixHDA_8000"。

1. 现在显卡、声卡、网卡应该都可以用了

1. 在登录AppleID之前，记得修改SMBIOS设置，参考这篇：<https://zhuanlan.zhihu.com/p/23932863>