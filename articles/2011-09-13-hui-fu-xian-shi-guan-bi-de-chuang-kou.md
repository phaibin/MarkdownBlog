---
layout: post
title: 恢复显示关闭的窗口
date: 2011-09-13 09:02
categories:
- Cocoa
tags:
- cocoa
published: true
comments: true
---
在Interface Builder中，将主窗口的"Release When Closed"选项取消掉。然后在delegate里实现如下方法：

    - (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag
    { 
      if (flag) {
        return NO;
      } else {
        [myWindow makeKeyAndOrderFront:self];
        return YES; 
      }
    }
