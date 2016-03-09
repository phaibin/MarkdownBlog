---
layout: post
title: 让用户在应用中进入 App Store 打分的代码
date: 2011-08-19 03:28
categories:
- iphone
tags:
- appstore
published: true
comments: true
---
App Store 上评论的链接地址是 itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id = appID

所以可以用这段代码:

    NSString *str = [NSString stringWithFormat:@&amp;quot;itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&amp;amp;amp;id=%d&amp;quot;, m_appleID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
