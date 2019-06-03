---
title: DELL 3670安装Mojave 10.14.5教程
date: 2019-06-03 10:34
---
### 制作安装U盘
1. 找一台苹果电脑，从商店下载Mojave，Applications里面会出现Install macOS Mojave.app

    ![3670-1](/images/3670-1.png)

1. 找一个8G以上的U盘，在macOS里面格式化，名字为：`Hackintosher`，格式选择`Mac OS Extended (Journaled)`，Scheme为`GUID Partition Map`

1. 控制台运行命令：`sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Hackintosher --applicationpath /Applications/Install\ macOS\ Mojave.app --nointeraction`

    ![3670-2](/images/3670-2.png)

1. 下载`Clover Configuration`，在`Mount EFI`里面加载U盘的EFI分区

    ![3670-3](/images/3670-3.png)

1. 下载[EFI文件夹](/attachment/3670_EFI.zip)，解压，复制EFI文件夹到U盘的EFI分区

### 安装

1. 安装U盘插入机箱后面的usb接口（前面板的接口会有问题）

1. 启动按F2进入BIOS，修改启动项，把U盘启动放到第一位

1. U盘启动之后，在Clover界面选择`Install Mojave`

1. 进入安装界面，先打开`Disk Utility`，格式化第一块128G的SSD，名字为`macOS`，格式为`APFS`

1. 退出`Disk Utility`，选择Install，硬盘选择刚刚格式化的macOS分区

1. 安装过程会重启好几次，U盘要一直插在电脑上，每次重启都要记得选择`Install Mojave from macOS`

### 安装后操作

1. 打开`Clover Configuration`，加载硬盘和U盘的EFI分区，把U盘的EFI文件夹copy到硬盘的EFI分区

1. 驱动wifi，在控制台执行下面的命令：

    ```
    curl -O https://raw.githubusercontent.com/kalifans/Darwin/Driver/ar956x-drv-osx.tar.gz
    tar zxvf ar956x-drv-osx.tar.gz
    cd ar956x-drv-osx
    ./ar956x-inst.sh
    ```

    然后重启

1. 之后启动就可以把U盘拔掉了

### 有问题的功能

1. 蓝牙有显示但是不能使用

1. 前置面板的usb不能使用

1. 休眠没有试，基本用不太到

1. 其余全部默认驱动

---

这篇文章里面的流程适用于所有的机器配置，不同机器配置所不同的只是Clover里面的设置（都在EFI文件夹里面）。针对不同的机器配置可以从网上搜索电脑型号，很有可能已经有人试验成功，这时候只需要把别人的EFI文件夹下载下来就可以用了。描述比较简单，更加详细的步骤可以Hackintosher的教程，Hackintosher的教程已经写的非常通俗易懂了。另外最全面最权威的黑苹果网站是tonymacx86。

参考：

<https://hackintosher.com/guides/guide-to-fresh-installing-macos-mojave-on-a-hackintosh-10-14/>

<https://github.com/inyan600/Dell-Inspiron-3670-Hackintosh>

<https://www.tonymacx86.com>