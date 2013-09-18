---
layout: post
title: Visual studio 2010 中文版正式版无法安装Silverlight4 Tools的解决办法
date: 2010-07-01 09:24
categories:
- .NET
tags: []
published: true
comments: true
---
打开注册表

打开节点：HKEY_LOCAL_MACHINESOFTWAREMicrosoftVisualStudio10.0SetupVSBuildNumber

在此处增加一个"字符串值"，输入名称为“1033”，设置它的值为“10.0.30319”