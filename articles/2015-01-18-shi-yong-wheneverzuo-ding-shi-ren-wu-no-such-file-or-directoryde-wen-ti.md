---
title: "使用whenever做定时任务报ruby：No such file or directory的问题"
date: 2015-01-18 12:24
---
参考：<http://develify.com/whenever-gem-problem-ruby-no-such-file-or-directory/>

Whenever gem使用系统的cron来做定时任务，会自动给crontab里面加入ruby脚本的调用。但是使用的时候单独调用脚本是好的，用cron会报"ruby: No such file or directory"。

搜索了一下找到一个解决方法，虽然不是很好，但是暂时可以解决问题。就是在crontab -e的脚本里面加入PATH环境变量：

PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin

PATH中要包含rbenv或者rvm的ruby路径。