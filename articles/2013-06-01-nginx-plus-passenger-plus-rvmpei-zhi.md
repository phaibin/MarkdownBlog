---
title: Nginx+Passenger+rvm配置
date: 2013-06-01 04:58
---
折腾了几天终于可以工作了，真不容易。

因为Thin在Mac下没办法自动启动，所以转而研究用Nginx+Passenger来实现。

安装Nginx和Passenger的方法有两种：

1. 先用gem安装Passenger，然后运行`passenger-install-nginx-module`来编译一个支持Passenger的Nginx出来
2. 先用gem安装Passenger，然后用brew来安装Nginx，并且带上下面的参数：

        brew install nginx --with-passenger
  带上这个参数会从当前环境找到Passenger，然后编译的时候加上Passenger的支持

安装Nginx完成之后检查Passenger模块:

    nginx -V 2>&1 | grep passenger

这两个方法我试过都可以，但是用brew编译Nginx的速度明显要快很多，而且brew安装软件的方式更统一。所以我还是喜欢第二种方式。

nginx.conf的写法：

    worker_processes  1;

    events {
      worker_connections  1024;
    }

    http {
      passenger_root /Users/leon/.rvm/gems/ruby-2.0.0-p0@global/gems/passenger-4.0.5;
      passenger_ruby /Users/leon/.rvm/wrappers/ruby-2.0.0-p0@global/ruby;

      include       mime.types;
      default_type  application/octet-stream;
      sendfile      on;
      keepalive_timeout  65;

      server {
        listen 8080;
        server_name leon.local;
        root /Users/leon/Desktop/Ruby/MarkdownBlog/public;   # <--- be sure to point to 'public'!
        passenger_enabled on;
        rack_env development;
      }
    }

其中passenger_root指向Passenger的安装位置，可以运行`passenger-config --root`来检查。passenger_ruby指向安装Passenger时的ruby路径，可以运行`which ruby`来检查。

server->root节点指向project/public路径，这个是定死的，不管是rack程序还是rails程序都要这么写，我的配置是一个Sinatra app，也要这么写。

接下来是怎么结合rvm。

nginx编译的时候就要指定Passenger的位置，之后就不能更改了。所以如果用gemset区分各个项目的环境的话，就会有问题。解决的方法就是把Passenger装在global这个gemset里面，这样每个gemset都包含Passenger了。

而且当nginx启动项目的时候，需要让nginx加载那个项目所属的gemset环境。这需要确保项目下面有两个必需的文件：

1. .rvmrc，里面这些写：

        rvm use 2.0@sinatra

2. config/setup_load_paths.rb，内容为：

        if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
          begin
            rvm_path     = File.dirname(File.dirname(ENV['MY_RUBY_HOME']))
            rvm_lib_path = File.join(rvm_path, 'lib')
            # $LOAD_PATH.unshift rvm_lib_path
            require 'rvm'
            RVM.use_from_path! File.dirname(File.dirname(__FILE__))
          rescue LoadError
            # RVM is unavailable at this point.
            raise "RVM ruby lib is currently unavailable."
          end
        end

        # Select the correct item for which you use below.
        # If you're not using bundler, remove it completely.

        # If we're using a Bundler 1.0 beta
        ENV['BUNDLE_GEMFILE'] = File.expand_path('../Gemfile', File.dirname(__FILE__))
        require 'bundler/setup'

        # Or Bundler 0.9...
        if File.exist?(".bundle/environment.rb")
          require '.bundle/environment'
        else
          require 'rubygems'
          require 'bundler'
          Bundler.setup
        end

    其中`$LOAD_PATH.unshift rvm_lib_path`这句在几个教程里面都有，但是我写上会报错，注释掉就好了。

这两个文件对于任何rack程序，rails或者sinatra程序，都是一样的。

这样配置之后，就可以把不同gemset里面不同的rack程序挂在同一个nginx服务器下面：

    server {
      listen 8080;
      server_name leon.local;
      root /Users/leon/Desktop/Ruby/blog/public;   # <--- be sure to point to 'public'!
      passenger_enabled on;
      rails_env development;
    }
    server {
      listen 8180;
      server_name leon.local;
      root /Users/leon/Desktop/Ruby/MarkdownBlog/public;   # <--- be sure to point to 'public'!
      passenger_enabled on;
      rack_env development;
    }

参考：  
<http://blog.crhan.com/2012/08/在-mac-10-8-下使用-passenger-rvm-的-rails-应用部署/>  
<http://ruby-china.org/wiki/mac-nginx-passenger-rails>  
<http://jeremy.wordpress.com/2010/08/19/ruby-rvm-passenger-rails-bundler-in-development/>  
<http://blog.ninjahideout.com/posts/the-path-to-better-rvm-and-passenger-integration>  