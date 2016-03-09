---
title: 配置Thin在Linux下面自动启动
date: 2013-07-14 16:19
tags:
- ruby
- thin
- linux
---
参考：<http://wxianfeng.com/tag/thin>  
<http://rabelapp.com/t/37>

以下假定ruby安装在rvm环境中，如果不是，需要把rvmsudo替换为sudo

1. rvmsudo thin install

    这句话的作用是在系统启动目录里生成thin的启动脚本。

    在CentOS下面的运行结果是：

        >> Installing thin service at /etc/rc.d/thin ...  
        mkdir -p /etc/rc.d  
        writing /etc/rc.d/thin  
        chmod +x /etc/rc.d/thin  
        mkdir -p /etc/thin  

        To configure thin to start at system boot:
        on RedHat like systems:
          sudo /sbin/chkconfig --level 345 thin on
        on Debian-like systems (Ubuntu):
          sudo /usr/sbin/update-rc.d -f thin defaults
        on Gentoo:
          sudo rc-update add thin default

        Then put your config files in /etc/thin

    在Ubuntu下面的运行结果是：

        >> Installing thin service at /etc/init.d/thin ...
        mkdir -p /etc/init.d
        writing /etc/init.d/thin
        chmod +x /etc/init.d/thin
        mkdir -p /etc/thin

        To configure thin to start at system boot:
        on RedHat like systems:
          sudo /sbin/chkconfig --level 345 thin on
        on Debian-like systems (Ubuntu):
          sudo /usr/sbin/update-rc.d -f thin defaults
        on Gentoo:
          sudo rc-update add thin default

        Then put your config files in /etc/thin

    在CentOS6上面的脚本位置其实不对，需要运行`mv /etc/rc.d/thin /etc/rc.d/init.d/thin`，移动一下位置

2. 把thin加入到启动中

    在CentOS上面运行：`sudo /sbin/chkconfig --level 345 thin on`，在Ubuntu上面运行：`sudo /usr/sbin/update-rc.d -f thin defaults`

3. 生成wrapper
    
    `rvm wrapper ruby-2.0.0-p247@sinatra bootup thin`

    这样会生成一个thin的wrapper：`/home/leon/.rvm/bin/bootup_thin`

4. 打开第一步生成的thin脚本，把里面的DAEMON修改为上面的bootup_thin的位置

    这样修改之后CentOS就可以正常启动thin了，但是在我的Ubuntu上面总是不行，搜索到了这个人修改的脚本：<https://gist.github.com/mapopa/3944992>，这样修改之后就好了，具体原因不详。

5. 生成项目的配置文件

    运行`rvmsudo thin config -C /etc/thin/myapp.yml -c /var/myapp -e production`

6. 测试启动：
    
    `/etc/init.d/thin start`  
    `/etc/rc.d/thin start`  
    `service thin start`  

    这样应该都可以启动thin。然后reboot看看thin有没有自动启动：`ps -ef | grep thin`