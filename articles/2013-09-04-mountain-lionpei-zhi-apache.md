---
title: Mountain Lion配置Apache
date: 2013-09-04 18:11
tags:
- mac
---
原文：<http://www.guomii.com/posts/30136>

开启Apache：
> sudo apachectl start

重启Apache：
> sudo apachectl restart

OS X 中默认有两个目录可以直接运行你的 Web 程序，一个是系统级的 Web 根目录，一个是用户级的根目录。

系统级的根目录是：
> /Library/WebServer/Documents/

对应的网址是：
> http://localhost

用户级的根目录是：
> ~/Sites

对应的网址是：
> http://localhost/~username

~/Sites也就是用户目录下的“站点”目录，这个目录可能没有，需要手动创建。

然后检查`/etc/apache2/users/`下面有没有“username.conf”这个文件，如果没有需要创建一个。然后把下面的内容写进去：

    <Directory "/Users/username/Sites/">
    Options Indexes MultiViews
    AllowOverride All
    Order allow,deny
    Allow from all
    </Directory>

然后赋予相应的权限：
> sudo chmod 755 /etc/apache2/users/username.conf

然后重启Apache以使配置文件生效：
> sudo apachectl restart
