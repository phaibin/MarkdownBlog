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
<p><p>错误信息： <p>HTTP Error 500.19 - Internal Server Error <br />The requested page cannot be accessed because the related configuration data for the page is invalid. <br />Detailed Error Information <br />Module : IIS Web Core Requested URL: http://localhost:80/ <br />Notification: Unknown Physical Path: <br />Handler : Not yet determined Logon Method : Not yet determined <br />Error Code : 0x80070005 Logon User : Not yet determined <br />Config Error: Cannot read configuration file due to insufficient permissions <p>解决办法：给站点跟目录添加权限IIS_USER的权限，允许该用户修改即可。</p></p></p></p>
