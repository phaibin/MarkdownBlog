---
title: 添加用户到sudoers中
date: 2013-07-08 16:22
tags:
- linux
- centos
---
有时候执行sudo会报：xx is not in the sudoers file，这是因为用户不在sudoers列表中，没有权限执行管理员的命令。Ubuntu中默认会把安装系统时建立的用户加入到sudoers中，而redhat和centos不会。

添加用户到sudoers中的步骤为：

1. 用`su -`切换到root用户
2. 然后`chmod u+w /etc/sudoers`，给/etc/sudoers文件加写权限
3. `vi /etc/sudoers`，找到`root  ALL=(ALL)  ALL`这一行，在下面加入：

        xxx  ALL=(ALL)  ALL

    xxx是你的用户名，然后保存退出
4. `chmod u-w /etc/sudoers`，去掉这个文件的写权限
