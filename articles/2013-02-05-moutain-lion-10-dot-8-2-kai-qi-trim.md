---
layout: post
title: Moutain Lion 10.8.2 开启Trim
date: 2013-02-05 00:48
categories:
- Mac
tags:
- ssd
- trim
published: true
comments: true
---
第一步：

    sudo perl -pi -e 's|(\x52\x6F\x74\x61\x74\x69\x6F\x6E\x61\x6C\x00).{9}(\x00\x4D)|$1\x00\x00\x00\x00\x00\x00\x00\x00\x00$2|sg' /System/Library/Extensions/IOAHCIFamily.kext/Contents/PlugIns/IOAHCIBlockStorage.kext/Contents/MacOS/IOAHCIBlockStorage

第二步：

    sudo kextcache -system-prelinked-kernel

第三步：

    sudo kextcache -system-caches

第四步：

    重启电脑
