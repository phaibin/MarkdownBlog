---
title: irb不能输入中文的诡异问题
date: 2014-01-13 14:39
---
我的blog一直用的好好的，突然写中文就会报错。然后发现只要在irb里面输入中文就会有问题。不是会变成Unicode代码，而是有很诡异的行为，比如提示是否要显示所有命令。

然后进行了下面的修复均告失败：

- 切换ruby的版本
- 重装ruby
- 给键盘换电池（因为iMac的键盘快没电了，猜想是键盘发神经）
- 换系统的Terminal（排除是iTerm的问题）

最好发现把shell换成bash居然好了。看来是zsh的问题。

1. 首先然后打开.zshrc，一句一句注释，发现注释这句之后就好了：

        source $ZSH/oh-my-zsh.sh

2. 然后开打$ZSH/oh-my-zsh.sh，继续分段注释，锁定在了这一段上面：

        # Load all of the config files in ~/oh-my-zsh that end in .zsh
        # TIP: Add files you don't want in git to .gitignore
        for config_file ($ZSH/lib/*.zsh); do
          source $config_file
        done

3. 继续把lib下面的zsh文件一个一个改名，发现改了"misc.zsh"就好了，说明问题在这个文件里面

4. 这个文件只有十几行，可是悲催的是试到了最后一行才发现问题：

        export LC_CTYPE=$LANG

###原来罪魁祸首就是没有设置$LANG环境变量！

可是最近我什么都没干啊，之前一直都是好好的。而且我在家里的电脑也没有设置，工作的好好的。真是活见鬼了。

---

终于可以在blog里面用rake新建文章了，然后居然pow又出问题了。报这样的错误：
> ArgumentError: invalid byte sequence in US-ASCII

明显是中文编码的问题。Google了一下原来是Encoding.default_external没有设置。在控制台和SublimeText里面分别打印一下这个值的内容，一个是“UTF-8”，一个是“US-ASCII”。所以原因就是在SublimeText和pow中不会去读取zsh的环境变量配置，也就读不到$LANG的值。

因为我用的是rvm，所有的ruby入口都是rvm-auto-ruby。查看一下这个脚本，发现里面会读取“$HOME/.rvmrc”里面的内容，所以尝试建立这个文件，然后写入$LANG的值，pow居然就好了。

唉，折腾一整天还是不明白是什么造成的。