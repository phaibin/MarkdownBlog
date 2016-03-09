---
layout: post
title: 修复升级到10.8之后命令行发送邮件失败的错误
date: 2012-08-24 09:46
categories:
- Mac
tags: []
published: true
comments: true
---
升级到10.8之后命令行发邮件就报这个错误：

    sendmail: fatal: chdir /Library/Server/Mail/Data/spool: No such file or directory

修复的方法是：
    sudo mkdir -p /Library/Server/Mail/Data/spool 
    sudo /usr/sbin/postfix set-permissions 
    sudo /usr/sbin/postfix start
