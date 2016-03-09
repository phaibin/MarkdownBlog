---
layout: post
title: heroku报ActiveRecord::ConnectionNotEstablished错误的解决办法
date: 2013-03-03 14:16
categories:
- RoR
tags: []
published: true
comments: true
---
原因是没有配置数据库信息，而且使用了ActiveRecord。

解决办法就是如果不需要数据库的话建立app的时候可以加上一个参数：`--skip-active-record`。如果是已经建立的项目，就把config/application.rb里面的

	require 'rails/all'
替换为：

	# require "active_record/railtie"
	require "action_controller/railtie"
	require "action_mailer/railtie"
	require "active_resource/railtie"
	require "sprockets/railtie"
	require "rails/test_unit/railtie"
 并且把包含active_record的几个地方注释掉。
