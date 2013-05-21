---
title: 让Sinatra自动加载修改的文件
date: 2013-05-17 07:46
tags:
- ruby
- sinatra
---
参考：<http://stackoverflow.com/questions/1247125/how-to-get-sinatra-to-auto-reload-the-file-after-each-change>

一个简单的方法就是安装shotgun这个gem，然后运行`shotgun`就启动起来了。每次请求都会重新加载整个环境。shotgun的缺点就是速度太慢，如果项目大的话就不能忍受了。

另外Sinatra本身提供了自动刷新的组件，叫`sinatra-reloader`，它是`sinatra-contrib`的一部分。要使用sinatra-reloader，应用程序必须使用Modular的形式，也就是定义一个继承自Sinatra::Base的子类。大致的代码是这样的：

    class MyApp < Sinatra::Base
      configure :development do |c|
        require 'sinatra/reloader'
        register Sinatra::Reloader
        c.also_reload File.dirname(__FILE__)+"/lib/*.rb"
      end
    end

configure :development只在开发环境下有效，`register Sinatra::Reloader`这句就可以重新加载Sinatra app。但是这一句只会reload Sinatra的处理器，手动加入的model等文件不会重新加载。`c.also_reload`的作用就是加入需要重载的其他文件。