---
layout: post
title: GPS开启状态判断
date: 2012-12-18 11:53
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
判断整个手机的GPS开启情况
    [CLLocationManager locationServicesEnabled]
判断单个app的GPS开启情况
    [CLLocationManager authorizationStatus]
返回值有4种情况：

- kCLAuthorizationStatusNotDetermined：用户还没有选择
- kCLAuthorizationStatusRestricted：app没有授权使用
- GPSkCLAuthorizationStatusDenied：用户显示地禁用了
- GPSkCLAuthorizationStatusAuthorized：允许使用
