---
title: NFS配置与连接
date: 2013-07-14 17:00
tags:
- linux
- nfs
---
参考：<http://www.linuxcast.net/course/49>，<http://blog.huatai.me/2013/02/08/mac-os-x-mount-linux-nfs.html>

1. NFSv2、NFSv3默认需要使用rpc服务，所以必须启动rpc服务：

        service rpcbind start
        chkconfig rpcbind on

    NFSv4不再需要rpc支持

2. 启动nfs和设置自动启动：

        service nfs start
        chkcofig nfs on

3. NFS使用4个动态端口，如果需要通过防火墙，需要配置NFS使用指定的静态端口。编辑/etc/sysconfig/nfs：

        mountd_port = "4001"     挂载使用端口
        statd_port = "4002"        共享状态使用端口
        lockd_tcpport= "4003"     TCP锁端口
        lockd_udpport= "4004"     UDP锁端口

    加上NFS协议的2049端口和RPC的111端口都需要允许通过

4. 添加共享的配置，打开/etc/exports，加上：
        /share    192.168.1.0/24(rw,sync)

5. 启用共享：`service nfs start` 或 `exports -r`

6. 可以使用`exportfs -v`查看共享

7. 客户端挂载：

        mount -t nfs 192.168.1.10:/share /mnt

    mount查看挂载。

8. Mac下面挂载的命令是：
      
        mount_nfs -P -o nolocks 192.168.7.189:/store /nfs_store/

    或者使用Finder的"Connect To Server"窗口，输入：nfs://192.168.7.189/store。如果连接不上，就在共享的属性里面加上一个insecure，比如：192.168.1.0/24(rw,insecure)

9. 更改共享目录的权限，使别的机器也可以写入数据