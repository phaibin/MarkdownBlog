---
layout: post
title: IIS7.5中 “HTTP Error 500.19 - Internal Server Error ” 解决
date: 2010-12-03 13:50
categories:
- .NET
tags: []
published: true
comments: true
---
错误信息：

    HTTP Error 500.19 - Internal Server Error 
    The requested page cannot be accessed because the related configuration data for the page is invalid. 
    Detailed Error Information 
    Module : IIS Web Core Requested URL: http://localhost:80/ 
    Notification: Unknown Physical Path: 
    Handler : Not yet determined Logon Method : Not yet determined 
    Error Code : 0x80070005 Logon User : Not yet determined 
    Config Error: Cannot read configuration file due to insufficient permissions

解决办法：给站点跟目录添加权限IIS_USER的权限，允许该用户修改即可。