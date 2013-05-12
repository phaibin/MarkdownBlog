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
<p><p>打开注册表</p>  <p>打开节点：HKEY_LOCAL_MACHINESOFTWAREMicrosoftVisualStudio10.0SetupVSBuildNumber</p>  <p>在此处增加一个&quot;字符串值&quot;，输入名称为“1033”，设置它的值为“10.0.30319”</p></p>
