---
title: 把Gem集成到项目中
date: 2013-07-30 18:26
tags:
- ruby
- gem
---
参考:<https://makandracards.com/makandra/538-freeze-vendor-unpack-a-single-ruby-gem-with-and-without-bundler>

1. 把gem目录从安装目录copy到项目的vendor/gems下面

2. 修改Gemfile文件，把gem的源修改为本地，比如：

        gem 'xmpp4r', :path => File.join(File.dirname(__FILE__), '/vendor/gems/xmpp4r-0.5')

3. 运行bundle，刷新gem

4. 在代码前面加上本地gem的加载路径

        $:.unshift(*Dir[File.dirname(__FILE__) + "/vendor/gems/**/lib"])

  
