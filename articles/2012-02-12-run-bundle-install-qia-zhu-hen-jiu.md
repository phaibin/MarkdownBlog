---
layout: post
title: run bundle install 卡住很久
date: 2012-02-12 12:35
categories:
- RoR
tags:
- Rails
published: true
comments: true
---
用rails new创建项目最后一步是`run bundle install`，这一步会卡住很久，因为会安装缺少的gems。可以用`rails new demo --skip-bundle`来跳过这一步，等rails new执行完了，进入项目的目录，修改Gemfile里面的source为：
`http://ruby.taoboa.org/`。

然后执行bundle install，这样就会快很多。
