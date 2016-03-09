---
title: "提升Xcode5里6.1模拟器的速度"
date: 2014-02-18 18:22
---
打开Xcode5的模拟器，切换到7.0之前的系统，比如6.1，就会发现里面的应用会一卡一卡的。在Xcode5.1beta版的release notes里面有关于这个的说明：

> Developers may experience performance issues when running apps within the iOS Simulator on Mavericks with a simulated OS version of iOS 6.1 or earlier. The suggested workaround for this issue is to disable timer coalescing while using the iOS 6.1 or earlier simulator. (15501929):  
    sudo sysctl -w kern.timer.coalescing_enabled=0

另外关于键盘偶尔不能使用的问题：

> The iOS simulator sometimes stops responding to hardware keyboard. Usually, quitting and relaunching the simulator will correct this. (14642684)