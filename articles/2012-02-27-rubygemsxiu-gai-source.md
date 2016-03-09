---
layout: post
title: Rubygems修改source
date: 2012-02-27 14:04
categories:
- RoR
tags:
- gem
- ruby
published: true
comments: true
---
淘宝建了一个Rubygems的镜像，这样gem的速度就快多了，官网是<http://ruby.taobao.org/>。

修改gem的source的方法是：

    $ gem sources --remove http://rubygems.org/
    $ gem sources -a http://ruby.taobao.org/
    $ gem sources -l
    *** CURRENT SOURCES ***

    http://ruby.taobao.org

    # 请确保只有 ruby.taobao.org
    $ gem install foo

或者直接修改~/.gemrc文件：

    :sources: - http://ruby.taobao.org/
