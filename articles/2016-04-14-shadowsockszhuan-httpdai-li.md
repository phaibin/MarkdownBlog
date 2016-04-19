---
title: Shadowsocks转http代理
date: 2016-04-14 16:47
---
Shadowsocks是socks代理，除了网页其他地方是没法用的。命令行下面就比较麻烦。

后来有了proxychains，可以在命令行下面用，但是还是有点麻烦，命令前面都要多加一个前缀。

我一直以来的方案是命令行下面太慢就连上vpn，执行完之后再断开vpn。虽然还是很麻烦，但是使用场景并不多，也还能接受。

今天我的vpn突然不能用了，捯饬了一阵突然想起来公司昨晚布置了防火墙，肯定是防火墙的问题。网管调整了一阵没见效，我就先看看有没有别的解决方案。

所以说科技让生活更美好，昨天还不能解决的问题，过一阵你再查查，也行就有了完美的方案。

我先是查到了这篇文章：<http://sxiaojian.com/2015/07/30/shadowsocks-terminal/>，作者跟我有一样的痛点，也不喜欢proxychains。但是他已经找到了更好的工具，名字叫proxifier。而且这种文章还是4月6日更新的，就在不久之前。这是一个客户端工具，可以配置让任何程序使用socks代理，估计跟老牌代理工具sockscap类似。

然后我查找proxifier的用法，又查到了这篇文章：<https://www.v2ex.com/t/260673>。在下面的评论里，有人提到了另外一个工具：privoxy。可以配置在.zshrc里面，实现自动翻墙，这明显要爽多了啊。所以privoxy就是我的终极方案。

这篇文章<http://www.akmumu.com/2015/07/07/367.html>把privoxy的用法讲的很全面。下面是我的总结。

1. brew install privoxy
1. 把privoxy加入自动启动：

        ln -sfv /usr/local/opt/privoxy/*.plist ~/Library/LaunchAgents
1. 编辑privoxy配置文件

        echo 'listen-address 0.0.0.0:8118' > /usr/local/etc/privoxy/config
        echo 'forward-socks5 / localhost:1080 .' >> /usr/local/etc/privoxy/config
1. 启动privoxy

        launchctl load ~/Library/LaunchAgents/homebrew.mxcl.privoxy.plist
1. 这时候就在本机建立了your ip:8118的http代理
1. 下面是建立本机的pac配置
1. brew install nginx
1. 把nginx加入自动启动：

        ln -sfv /usr/local/opt/nginx/*.plist ~/Library/LaunchAgents
1. 编辑配置：/usr/local/etc/nginx/nginx.conf，端口改为80
1. 找到一份Shadowsocks的pac配置，一般在：http://127.0.0.1:8090/proxy.pac
1. 把其中的`SOCKS 192.168.1.122:1080`，替换为`PROXY 192.168.1.133:8118`
1. copy到nginx的目录中：/usr/local/Cellar/nginx/1.8.0/html
1. 编辑nginx的MIME配置：/usr/local/etc/nginx/mime.types，将pac文件的类型设置为：`application/x-ns-proxy-autoconfig`
1. sudo nginx
1. 这时候你的pac就建立好了：http://your ip/proxy.pac
1. 还有最主要的在.zshrc里面加入代理（记得忽略本地地址）：

        export http_proxy='http://127.0.0.1:8118'
        export https_proxy='https://127.0.0.1:8118'
        export no_proxy='localhost,127.0.0.0/8,172.16.0.0/12,192.168.0.0/16'

等一切都配置好之后，我满心欢喜地敲了`npm install`，等待完美的结果。可是等来的只是无尽的等待。。。

运行`curl https://twitter.com`是没有问题，可是`npm install`到`npm http request GET https://registry.npmjs.org/meow`的时候，就卡住不动了。

试了下单独在npm中配置代理

    npm config set proxy http://localhost:8118

是可以的！这应该是npm的bug。
