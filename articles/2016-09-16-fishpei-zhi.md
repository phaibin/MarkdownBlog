---
title: Fish配置
date: 2016-09-16 11:19
---
Fish安装很容易，brew install fish就好了。

与oh-my-zsh相似，也有一个对应的oh-my-fish。不过又出现了一个更流行的管理器：[Fisherman](https://github.com/fisherman/fisherman)。

安装：`curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher`。

使用：

- fisher ls：列出安装的插件
- fisher ls-remote：列出所有插件
- fisher [plugin]：安装插件
- fisher remove [plugin]：卸载插件

Fisherman带的插件不多，不过可以安装omf(oh my fish)的插件。

一些常用插件：

- omf/theme-default：omf的默认主题
- omf/osx：操作osx的插件
- omf/proxy：代理
- nvm：集成nvm
- rbenv：集成rbenv
- grc：高亮插件，需要先brew install grc

配置文件是： `~/.config/fish/conf.d/config.fish`。我的配置文件：

    alias fishconfig "vi ~/.config/fish/conf.d/config.fish"
    alias podi "pod install --verbose --no-repo-update"
    alias podu "pod update --verbose --no-repo-update"
    set -g -x proxy_host 127.0.0.1:8118
    set -g -x proxy_auth false
    set -g -x no_proxy "localhost,127.0.0.1,172.16.0.0/12,192.168.0.0/16,baidu.com"

    set -gx NVM_DIR /Users/leon/.nvm
    bass source $NVM_DIR/nvm.sh >/dev/null ^&1

最后两行是用来修复nvm的。在集成nvm之后，npm全局安装的命令没法执行，只有运行一下node或者npm才能加载环境。加上这两句就好了。

如果使用omf的默认theme，里面有一些function是Fihserman缺少的，这里放一个下载：[fish.zip](/attachment/fish.zip)。这个包里面还有一个`.config/fisherman/default/fish_prompt.fish`文件。因为默认的主题会把路径里面的目录简写，这个文件的修改就是显示全路径。

grc这个插件有个问题，它会把ls命令的输出列表变成竖的，就像ll那样。修复的方法就是修改`.config/fisherman/grc/init.fish`文件，把里面的ls删掉。

