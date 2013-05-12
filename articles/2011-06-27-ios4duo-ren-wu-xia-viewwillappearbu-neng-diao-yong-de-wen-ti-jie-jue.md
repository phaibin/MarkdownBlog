---
layout: post
title: IOS4多任务下，viewWillAppear不能调用的问题解决
date: 2011-06-27 11:34
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>由于IOS4支持多任务，应用程序按【home】是只是转到当前活动应用的后面，并没有退出，相当于画面暂停了。可以在</p>
<p><span style="color:black;margin:0;padding:0;">- (</span><span style="color:#7f0055;font-weight:bold;margin:0;padding:0;">void</span><span style="color:black;margin:0;padding:0;">)applicationDidEnterBackground:(UIApplication *)application</span></p>
<p><span style="color:black;margin:0;padding:0;">里面</span>运行viewWillDisappear方法。在</p>
<p>- (<span style="color:#7f0055;font-weight:bold;margin:0;padding:0;">void</span><span style="color:black;margin:0;padding:0;">)applicationWillEnterForeground:(UIApplication *)application</span></p>
<p><span style="color:black;margin:0;padding:0;">里面</span>运行viewWillAppear方法。</p></p>
