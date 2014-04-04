---
title: Bundler引用Git里面的Gem
date: 2014-04-04 15:58
---
参考：<http://stackoverflow.com/questions/3846859/installing-a-gem-from-github-with-bundler>

用Bundler可以在Gemfile中指定gem的源为Github的某个仓库，如：

    gem 'ipa_reader', git: "git://github.com/phaibin/Ipa-Reader.git"

但是这样运行bundle install之后再Gem list是看不到刚才安装的gem的。在irb里面require也不行。原因在上面的链接里面也讲到了，因为Rubygems本来就没有办法来管理git中的gem。

但是还是有办法用到他们的，就是先

    require 'bundler/setup'

这样就可以引用从git中安装的gem了。