---
title: Ubuntu安装shadowsocks服务
date: 2015-05-31 18:14
---
之前使用的shadowsocks网站停止服务，搜索了一上午也没有找到更好的服务，无奈只能自己买个Digital Ocean，自己搭建SS服务器了。

原来自己搭比买还要容易，不到两分钟搞定，其实就是几个命令而已。

1. apt-get install python-pip
1. pip install shadowsocks
1. 创建/etc/shadowsocks.json，内容为：

		{
		    "server":"你的服务器ip地址",
		    "server_port":8388,
		    "local_address": "127.0.0.1",
		    "local_port":1080,
		    "password":"你设置的密码",
		    "timeout":300,
		    "method":"aes-256-cfb",
		    "fast_open": false
		}
1. 启动：ssserver -c /etc/shadowsocks.json -d start

打开网页，各种服务器瞬间原地满讯复活。y2b 1080p也是毫无压力（我用了新加坡节点，并不像很多人说的很慢）。

如果有人想注册就点我的优惠链接吧：<https://www.digitalocean.com/?refcode=480d75bf742f>，我们都能得到优惠。