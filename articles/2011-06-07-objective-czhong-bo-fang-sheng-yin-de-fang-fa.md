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
<p><p>首先加入AudioToolbox.framwork，然后加入头文件：</p>
<p>#import &lt;AudioToolbox/AudioToolbox.h&gt;</p>
<p>播放的代码为：</p>
<p>NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];<br />SystemSoundID soundID;<br />AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &amp;soundID);<br />AudioServicesPlaySystemSound(soundID);</p></p>
