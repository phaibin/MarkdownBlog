---
layout: post
title: objective-c中播放声音的方法
date: 2011-06-07 14:01
categories:
- iphone
tags: []
published: true
comments: true
---
首先加入AudioToolbox.framwork，然后加入头文件：

    #import <AudioToolbox/AudioToolbox.h>

播放的代码为：

    NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    AudioServicesPlaySystemSound(soundID);
