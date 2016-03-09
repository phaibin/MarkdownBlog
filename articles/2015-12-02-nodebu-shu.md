---
title: Node部署
date: '2015-12-02 12:13'
tags:
- node
---
Ruby里一般用capistrano来部署，非常方便。搜索Node部署发现还真的有人直接用capistrano来部署Node应用。然后搜索有没有Node的原生的类capistrano工具，还真的有一个，叫[shipit](https://github.com/shipitjs/shipit)。

首先全局安装shipit-cli：

    npm install --global shipit-cli

然后在项目根目录建立一个shipitfile.js文件，按照官方的例子加入自己的配置。另外需要安装几个插件。

* shipit-deploy：shipit官方的部署插件
* shipit-npm：集成npm install命令
* shipit-pm2：集成pm2命令

我的配置为：

    module.exports = function (shipit) {
      require('shipit-deploy')(shipit);
      require('shipit-npm')(shipit);
      require('shipit-pm2')(shipit);

      shipit.initConfig({
        default: {
          workspace: '/tmp/github-monitor',
          deployTo: '/home/deploy/workspace/NodeMDBlog',
          repositoryUrl: 'https://github.com/phaibin/NodeMDBlog.git',
          ignores: ['.git', 'node_modules'],
          rsync: ['--del'],
          keepReleases: 2,
          shallowClone: true,
        },
        staging: {
          servers: 'phaibin-vultr'
        }
      });
    };

这样运行shipit staging deploy，就会在服务器部署最新的代码，然后运行npm install，最后重启pm2服务。

shipit-pm2插件需要加入一个app.json文件作为pm2的配置文件。

碰到的几个问题：

1. 非root用户运行在80端口下

  我部署使用的是deploy用户，在deploy用户下安装nvm，然后再安装node，所以root用户找不到node。有三个办法来解决，一种是用nginx来转发，一种是iptables重定向，一种是给普通用户权限。我使用的是第三种方法，简单一点。

      sudo apt-get install libcap2-bin
      sudo setcap cap_net_bind_service=+ep /usr/bin/nodejs

  参考：<http://hongtoushizi.iteye.com/blog/2229812>

1. ssh运行命令提示找不到

  研究shipit的过程中我才知道原来ssh可以直接在远程执行命令：
        ssh deploy@sever 'pwd'

  这样就可以在远程服务器运行命令，然后直接返回。需要注意的是如果是多条命令，需要用单引号来括起来。如果用双引号，会先解析其中的变量。比如：

        ssh deploy@sever 'echo $PATH'
        ssh deploy@sever "echo $PATH"

  单引号是返回服务器的path，双引号是返回本地的path。参考：<http://blog.csdn.net/zklth/article/details/6289677>。

  shipit的原理也是通过ssh直接在远程执行命令来完成的。

  但是我执行shipit碰到了node: command not found错误。

  原理bash有4种模式，像ssh运行命令属于non-interactive模式，在这种模式下用户的某些环境变量没有加载进来，所以找不到node。

  在这篇文章中 <http://feihu.me/blog/2014/env-problem-when-ssh-executing-command-on-remote/> 对bash的几种模式讲的很详细。

  在.bashrc文件的开头有这么几行：

        # If not running interactively, don't do anything
        case $- in
            *i*) ;;
              *) return;;
        esac

  看到这几行你就会明白了。如果是在non-interactive模式，从这里就返回了，而nvm的脚本在文件的末尾，当然就不会执行了。

  所以把nvm的语句移到这几句话之前，或者干脆把这几句移到文件末尾就好了。

  参考：<http://stackoverflow.com/questions/216202/why-does-an-ssh-remote-command-get-fewer-environment-variables-then-when-run-man>

---

另外一个很有意思的部署工具：<https://github.com/yyx990803/pod>

类似于Heroku的部署，git push就是部署。也就是在服务器建立一个git仓库，把代码push上去，同时部署代码，重启服务器。对于个人作品非常方便。


参考：   
<http://pm2.keymetrics.io>    
<http://www.boiajs.com/2014/12/30/pm2-begin-nodejs-production>    
<http://notes.knovour.ninja/deploy-node-js-by-shipit/>    
<http://boke.io/node-ying-yong-bu-shu/>
