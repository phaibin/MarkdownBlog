---
title: 解决heroku不能提交代码
date: 2013-05-09 11:19
---
参考：<http://ruby-china.org/topics/10813>

最近heroku不能提交代码，git push总是time out。但是连了VPN就可以了，很明显是被qiang了。妈的真没天理。这年头免费的VPN真不好找，有几个用了几次就连不上了。今天搜索了半天终于有了重大发现，原来改配置就可以访问了，不需要连VPN了。

编辑`~/.ssh/config`，加入：

    Host heroku.com
    User freemember007
    Hostname 107.21.95.3 #关键设置，替代proxy.heroku.com，直接走IP。
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa
    port 22

另外运行`ssh -v git@heroku.com`可以找出对你有效的IP，前提是在~/.ssh/config里指定的Hostname为proxy.heroku.com。