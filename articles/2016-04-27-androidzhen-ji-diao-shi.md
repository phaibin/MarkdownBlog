---
title: Android真机调试
date: 2016-04-27 13:05
---
建立文件`~/.android/adb_usb.ini`，里面的内容为：

    # ANDROID 3RD PARTY USB VENDOR ID LIST -- DO NOT EDIT.
    # USE 'android update adb' TO GENERATE.
    # 1 USB VENDOR ID PER LINE.
    0x04e8
    0x12d1
    0x2717
    0x1004

每一行是一个设备厂商ID。设备厂商ID可以用下面的命令来查找：

    system_profiler SPUSBDataType

这个命令可以建立一个alias：

    alias lsusb="system_profiler SPUSBDataType"

