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

ps：在参考的那篇文章里面，在copy完gem目录之后，还需要运行gem命令生成一些文件，我试验的过程中并不需要那些步骤。
