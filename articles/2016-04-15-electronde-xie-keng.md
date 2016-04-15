---
title: Electron的一些坑
date: 2016-04-15 09:11
---
用Electron如果只是做一个网站的外壳还是挺简单的，start kit很容易就可以跑起来。可是后来大把的时间我都花在了打包上面，真的是坑的不轻。

####打包

官方并没有给一个打包工具，所有的工具都是第三方的。有一个比较靠谱的是[Electron-Builder](https://github.com/electron-userland/electron-builder)。这个工具配置好之后会自动打包OS X dmg和windows的installer，linux的包应该也可以，不过我没有试验。

配置可以参数这个项目[ea-todo](https://github.com/Vj3k0/ea-todo)。这个项目来源于这个网站：<http://electron.rocks>。这个网站的作者写了一系列Electron的文章，真的是帮了入门者的大忙。可以完全copy一份代码，然后在上面改，需要修改的东西不会很多。有几点需要注意的：

1. 安装最新的node和npm，我开始用的是比较老的版本，npm报错，升级到最新的就没问题了
1. 用npm，不要用cnpm和pnpm，pnpm和cnpm都很快，但是安装完package运行报错，npm就没问题，所以我就记得只用npm了。尤其是当配置了命令行代理之后，就更没有必要用别的工具了。参考我上一篇文章：[Shadowsocks转http代理](http://phaibin.tk/2016/04/14/shadowsockszhuan-httpdai-li)。
1. electron、electron-builder和electron-packager最近都更新的很频繁，记得安装最新的版本，小问题可能很快就改掉了。
1. electron-builder有几个版本打包OS X app的时候没有icon，后来的版本修复掉了。
1. 在OS X上面打包windows安装文件的时候，会使用electron-prebuilt来生成windows平台的native module，项目中有的package会导致打包的windows程序不能运行，如果出现这种情况就从这个package着手来查问题。
1. 项目根目录下面的package.json里面的`iconUrl`是一个网络的url，而不是本地的地址，它的实际用处是`windows安装卸载程序`里面程序的图标。
1. 在app/package.json里面可以加入一个`productName`属性，这样所有生成的可执行文件和安装包的名字都会从`productName`取，而不是`name`。这个名字中可以加空格，但是如果取中文，打包windows安装包的时候就会报错。这个错误的根源在wine，基本是无法解决的。但是我从`electron-packager`着手进行了修复。可以参考我的修改版[electron-packager](https://github.com/phaibin/electron-packager)。其实只改了一个文件：`win32.js`，修复的原理很简单，就是先用`name`来打包，然后把文件重命名为`productName`。不过还有一个问题没法解决，就是OS X打包dmg的时候`background.png`没有生效。

####自动更新

在ea-todo的代码中已经有了自动更新的例子，完全可以照搬。electron-builder在打包的同时也会生成更新包。你还需要建立一个检测更新的服务端程序，ea-todo的作者同样给了demo：[ea-todo-server](https://github.com/Vj3k0/ea-todo-server)。你可以部署到heroku上面。OS X和windows的更新机制不同。

- OS X使用`manifest.json`文件和dmg文件
- windows使用`RELEASES`文件和.nupkg文件

每次更新的工作就是把正确的4个文件放到正确的位置就好了，electron程序启动的时候会自动检测更新，下载更新包。下次启动就会启动新版本了。

另外OS X上需要建立一个证书做签名，具体参考这篇文章：<http://electron.rocks/publishing-for-os-x/>。

####菜单

可以找electron官方的例子，注意OS X和windows的菜单会是不同的，快捷键也不同。

####自动启动

有一个package叫`auto-launch`。这个package很方便，只有3个方法，isEnable()、enable()和disable()。帮你包办了OS X和windows上面的自动启动。

不过有一个问题，isEnable方法如果写在菜单的点击方法里面，在OS X上面运行的时候会永远返回false，windows上面则没有问题。原因是它在OS X上面会用`applescript`这个package来运行apple script来获取所有的启动项，这个package估计是在子进程运行有问题，获取的启动项为空。

我把auto-launch改了一下：<https://github.com/phaibin/node-auto-launch>，换了一个运行apple script的package，然后就没问题了。

####保存数据

有一个很方便的package：`electron-json-storage`，来保存一些设置。只需要用 set key, get key，这种形式来使用就好了。

####安全

Electron是一项Web技术，要保护代码是不可能的，在Electron和Atom的社区都有讨论，他们也没有计划做任何安全性的工作。

不过我后来搜索到这么一篇文章：<https://wiredcraft.com/blog/high-security-electron-js-application/>。看到这篇文章有点大开眼界。这篇文章讲了他的公司为了给缅甸大选做投票系统，而做的选型考虑。是用C++/C#这样的原生代码，但是Electron这样的Web技术。最后他们的选择居然是Electron。不过他们为了安全性，把一部分数据保存的工作移到了Go开发的底层模块中，然后用js来调用Go的功能。里面讲到Go官方并不支持他们的数据库SQLCipher，于是他就自己写了一个Go的适配器！真NB！然后我发现作者居然是中国人，他的公司就在上海，哈！

####其他

1. 网页中报jQuery not found错误，在就BrowserWindow的初始化中加入一个参数：

        mainWindow = new BrowserWindow({
          name: "vipmro",
          width: 1280,
          height: 1000,
          toolbar: false,
          title: '工品汇',
          webPreferences: {
            nodeIntegration: false,
          }
        });
1. 窗口标题，参考上面的title参数
1. electron默认会用网页的title来做窗口的title，可以阻止这种行为：

        mainWindow.on('page-title-updated', function(event) {
          event.preventDefault();
        });
1. 最大化窗口

        mainWindow.maximize(); 
1. 防止新开窗口：

        mainWindow.webContents.on('new-window', function(event, url, frameName, disposition, options) {
          event.preventDefault();
          mainWindow.loadURL(url);
        });
1. 我发现electron程序跟浏览器行为一样，会记住用户的登录，什么工作也不需要做。但是公司的网站不行，应该是本身网站的程序有问题。

####参考

- [Electron中文文档](https://www.gitbook.com/book/wizardforcel/electron-doc/details)
- [ELECTRON ROCKS!](http://electron.rocks)，Electron爱好者建的小站，文章都很棒
- [Electron SuperKit](https://github.com/Aluxian/electron-superkit)
- [Awesome Electron](https://github.com/sindresorhus/awesome-electron)，Electron的一些精彩应用
- [Electron Fundamentals](http://maxogden.com/electron-fundamentals.html)，Electron的一篇高级教程









