---
layout: post
title: 在Rails中利用Gmail发送邮件
date: 2009-05-24 21:32
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>在Rails1.2中ActionMailer只能用本地的SMTP服务器发送邮件，经过搜索，找到了下面的方法可以用Gmail来发送邮件：</p> <p>切换到项目目录下，运行：</p> <blockquote> <p>ruby script/plugin install http://svn.nanorails.com/plugins/action_mailer_tls</p></blockquote> <p>这会安装action_mailer_tls插件。</p> <p>接着，在environment.rb中加入以下代码，启用action_mailer_tls</p> <blockquote> <p>require "smtp_tls"<br />mailer_config = File.open("#{RAILS_ROOT}/config/mailer.yml")<br />mailer_options = YAML.load(mailer_config)<br />ActionMailer::Base.smtp_settings = mailer_options</p></blockquote> <p>在config目录下建立mailer.yml文件，加入邮箱的配置： <blockquote> <p>:address: smtp.gmail.com<br />:port: 587<br />:user_name: xxx@gmail.com<br />:password: xxxxx<br />:authentication: :plain</p></blockquote></p></p>
