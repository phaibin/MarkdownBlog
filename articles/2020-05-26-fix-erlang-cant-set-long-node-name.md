---
title: Fix erlang Can't set long node name
date: 2020-05-26 21:24
---
在Linux上面只要在hosts里面加上下面一行就可以了

```
127.0.1.1       leon-xubuntu.localdomain leon-xubuntu
```

如果Mac在域里面是不会出问题的。上面的修复方法对Mac不起作用，Mac上面需要把hostname指定为完整带域名的形式。

```
sudo scutil --set HostName Leons-Mac-Pro.local
```

这样`hostname`会返回`Leons-Mac-Pro.local`，`hostname -s`会返回`Leons-Mac-Pro`。

其实错误信息已经很明显了，就是找不到长主机名。