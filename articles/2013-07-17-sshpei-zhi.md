---
title: SSH配置
date: 2013-07-17 14:04
tags:
- linux
- ssh
---
如果不想输入密码，直接用证书的形式来进行SSH登录，需要下面几个步骤：

1. 在本机运行`ssh-keygen -t rsa`，生成id_rsa、id_rsa.pub两个文件，一个私钥，一个公钥

2. 把id_rsa.pub文件copy到目标机器的~/.ssh目录下面，执行`cat id_rsa.pub >> ~/.ssh/authorized_keys`

3. 把.ssh的权限设为700，authorized_keys文件设为600

正常这样就可以通过`ssh user@10.0.0.x`来登录到目标机器了。

我在一台机器配置了没有问题，但是另外一台机器怎么都不行。比较了各种设置发现都是一样的。

然后搜索到了这篇文章：<http://flysnowxf.iteye.com/blog/1567570>。根据这篇文章里面的命令，把SELinux关闭了果然可以登录了。但是另外一台正常的机器并没有关闭SELinux，所以根本原因不是这个。于是我继续搜素。

经过试验发现我通过/usr/sbin/sshd来启动sshd的服务，是可以正常登录的，但是用service sshd start启动就不行。根据这个情况我搜索到了这篇：<http://serverfault.com/questions/321534/public-key-authentication-fails-only-when-sshd-is-daemon>。跟我碰到的情况居然一模一样。

于是根本原因就是，我的.ssh目录的文件标签不对。运行`ls -alZ`可以看到文件标签，我在修复之前的标签是：

    unconfined_u:object_r:admin_home_t:s0

运行`restorecon -r -vv /root/.ssh`修复之后：

    system_u:object_r:ssh_home_t:s0

因为文件标签不对，所以SELinux阻止了访问。所以之前通过关闭SELinux也可以修复这个问题（但是并不是最好的解决方案）。

从前根本不知道SELinux是什么，通过这个问题才有了一点了解。[这篇文章](http://linuxtoy.org/archives/selinux-introduction.html)讲解的比较详细，以后慢慢研究。

另外，几个调试SSH出错的方法：

1. 客户端可以用ssh -v打印出具体的连接信息

2. 服务器先把sshd服务停掉，然后运行`/usr/sbin/sshd -d`，当有客户端连接的时候，服务器会把连接信息打印出来