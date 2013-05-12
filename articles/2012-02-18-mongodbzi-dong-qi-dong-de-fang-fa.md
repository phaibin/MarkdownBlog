---
layout: post
title: MongoDB自动启动的方法
date: 2012-02-18 22:54
categories:
- RoR
tags:
- mongodb
published: true
comments: true
---
用homebrew装完mongodb之后就会有一个提示，或者打命令：`brew info mongo`也可以显示：

    mongodb 2.0.2-x86_64
    http://www.mongodb.org/
    /usr/local/Cellar/mongodb/2.0.2-x86_64 (18 files, 121M)
     
    If this is your first install, automatically load on login with:
    mkdir -p ~/Library/LaunchAgents
    cp /usr/local/Cellar/mongodb/2.0.2-x86_64/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
     
    If this is an upgrade and you already have the homebrew.mxcl.mongodb.plist loaded:
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    cp /usr/local/Cellar/mongodb/2.0.2-x86_64/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
     
    Or start it manually:
    mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf
     
    The launchctl plist above expects the config file to be at /usr/local/etc/mongod.conf.
    If this is a first install, you can copy one from /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf:
    cp /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf /usr/local/etc/mongod.conf
     
    http://github.com/mxcl/homebrew/commits/master/Library/Formula/mongodb.rb
 
所以加入自动启动的方法就是：

    mkdir -p ~/Library/LaunchAgents
    cp /usr/local/Cellar/mongodb/2.0.2-x86_64/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/
    cp /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf /usr/local/etc/mongod.conf
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

因为`homebrew.mxcl.mongodb.plist`里面把mongod文件的位置设为了`/usr/local/bin/mongod`，所以要确保你的这个文件确实存在。

安装完之间可以检查mongod进程是否已经存在，还可以访问http://localhost:28017来检查mongod的状态。

启动和停止mongod服务的方法是：

    launchctl start homebrew.mxcl.mongodb
    launchctl stop homebrew.mxcl.mongodb

通过网页方式访问服务器的时候可能会出一个提示：REST is not enabled，解决方法是在/usr/local/etc/mongod.conf中加入：rest = true。
