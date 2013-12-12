---
title: SublimeLinter的使用
date: 2013-12-12 11:48
---
SublimeLinter是Sublime Text中的一个插件，用来检测代码的语法错误。支持的语言有很多，比如：html、javascript、css、ruby等等。

先用Package Control安装插件，然后选择SublimeLinter下面的Settings - User，进行配置。

主要是加入`sublimelinter_executable_map`的配置，它是用来指示每种语言的检测工具。比如我的是：

    "sublimelinter_executable_map":
    {
      "html": "/usr/local/bin/tidy",
      "javascript": "/usr/local/bin/node",
      "ruby": "rvm-auto-ruby"
    },

表示html用tidy进行检测，js用node检测。

另外一个主要的选项是：
  
    "sublimelinter": true,

表示检测的时机。默认为true，表示检测自动在后台进行。其他还有“save-only”，表示保存时才检测。

当检测出错误时会这样提示：

![SublimeLinter-1](/images/articles/SublimeLinter-1.png)

鼠标移动出错的行会在状态栏显示错误信息。

加入下面的配置：

    "sublimelinter_popup_errors_on_save": true

会在保存时弹出错误信息：

![SublimeLinter-2](/images/articles/SublimeLinter-2.png)
