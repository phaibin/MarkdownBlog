---
title: Android编译唤醒设备
date: 2016-06-20 16:20
---
做iOS开发的时候，把iPhone连上数据线，把项目从Xcode跑到设备的时候，iPhone会自动亮起。不过如果iPhone有锁需要手动解锁。

但是用Android Studio来编译app到设备的时候，即使设备没有锁，也不会自动亮起，还是需要手动把设备点亮，很麻烦。

经过搜索，我发现了一个解决方案，通过在项目中加入一小段代码，就可以实现自动点亮设备的功能。

    if (BuildConfig.DEBUG) {
        // These flags cause the device screen to turn on (and bypass screen guard if possible) when launching.
        // This makes it easy for developers to test the app launch without needing to turn on the device
        // each time and without needing to enable the "Stay awake" option.
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON
                | WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD
                | WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);
    }

很神奇的是，即使设备有锁，你的app也能跑出来，点后退就会回到锁屏界面。

参考：<http://stackoverflow.com/questions/22332513/wake-and-unlock-android-phone-screen-when-compile-and-run-project>
