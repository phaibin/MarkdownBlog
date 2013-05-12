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
<p><p>App Store 上评论的链接地址是 itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&amp;id = appID</p>
<p>所以可以用这段代码:</p>
[code lang="objc" toolbar="false"]<br />
NSString *str = [NSString stringWithFormat:@&amp;amp;quot;itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&amp;amp;amp;amp;id=%d&amp;amp;quot;, m_appleID];<br />
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];<br />
[/code] </p>
