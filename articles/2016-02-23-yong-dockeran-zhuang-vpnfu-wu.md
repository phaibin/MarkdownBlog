---
title: 用Docker安装VPN服务
date: '2016-02-23 13:29'
---
在Ubuntu上配置Shadowsocks非常简单，没想到VPN这么麻烦，找了好几篇文章都不行。据说可以用Docker来配置，刚好玩一下Docker。

首先安装Docker：

    curl -sSL https://get.docker.com/ | sh

然后运行一个别人建好的image：

    docker run -d --privileged --net=host -v {local_path_to_chap_secrets}:/etc/ppp/chap-secrets mobtitude/vpn-pptp

把{local_path_to_chap_secrets}替换为本地的密码文件。一般为/etc/ppp/chap-secrets，内容是这样：

    # Secrets for authentication using PAP
    # client    server      secret      acceptable local IP addresses
    username    *           password    *

然后就没有然后了。果然超级简单。具体参考：[mobtitude/vpn-pptp](https://hub.docker.com/r/mobtitude/vpn-pptp/)。

Shadowsocks也可以用Docker来配置：

    docker run -d -p 1984:1984 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 1984 -k $SSPASSWORD -m aes-256-cfb

不过Docker的image貌似会占用不少磁盘空间，运行这么小的服务确实感觉有点小题大做。
