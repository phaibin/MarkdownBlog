---
title: "加速CocoaPods"
date: 2015-01-25 20:02
---
方法一：
在执行Pod install的时候会升级CocoaPods的spec仓库，加下面的参数就可以省略这一步，速度会提升不少：

    pod install --verbose --no-repo-update
    pod update --verbose --no-repo-update


方法二：
某人的国内镜像：

    pod repo remove master
    pod repo add master https://git.oschina.net/6david9/Specs.git
    pod repo list

