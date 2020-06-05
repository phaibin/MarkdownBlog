---
title: github设置代理
date: 2020-06-04 15:07
---
#### https协议 (https://github.com/...)

```
git config --global http.proxy 'http://127.0.0.1:8888'
git config --global https.proxy 'http://127.0.0.1:8888'
```

或者直接修改~/.gitconfig文件，加入：

```
[http]
	proxy = http://127.0.0.1:8888
[https]
	proxy = http://127.0.0.1:8888
```

#### ssh协议 (git@github.com:...)

修改~/.ssh/config，加入：

```
Host github.com
    User git
    ProxyCommand nc -v -x 127.0.0.1:8889 %h %p
```

这里的代理必须为socks代理

#### git协议 (git://github.com/...)

修改~/.gitconfig文件，加入：

```
[core]
	gitproxy = /Users/leon/gitproxy
```

gitproxy是自己建的一个脚本：

```
#!/bin/sh
exec nc -v -x 127.0.0.1:8889 $1 $2
```