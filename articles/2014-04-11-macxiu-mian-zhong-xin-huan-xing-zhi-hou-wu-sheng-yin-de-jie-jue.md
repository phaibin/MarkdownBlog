---
title: Mac休眠重新唤醒之后无声音的解决
date: 2014-04-11 14:13
---
参考：<http://www.zhihu.com/question/21975970>

重启可以解决，但是麻烦。

结束coreaudio进程无效。

现在有用的就是执行：

    sudo kextunload /System/Library/Extensions/AppleHDA.kext
    sudo kextload /System/Library/Extensions/AppleHDA.kext