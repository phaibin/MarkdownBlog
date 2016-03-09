---
title: Xcode插件
date: 2015-04-09 16:29
---
首先安装Xcode插件管理器：[Alcatraz](http://alcatraz.io)。安装完之后会在Xcode的Window菜单下面多出一项：Package Manager。

打开Package Manager就可以安装和查看插件了。

有用的插件：

1. [SCXcodeSwitchExpander](https://github.com/stefanceriu/SCXcodeSwitchExpander)

    自动生成所有枚举的分支

1. [ClangFormat-Xcode](https://github.com/travisjeffery/ClangFormat-Xcode)

    使用ClangFormat工具来自动格式化代码。如果希望自定义代码的格式，可以这样做：
    * 用homebrew安装clang-format
    * 基于某个基本样式生成配置文件，比如基于llvm：clang-format -style=llvm -dump-config > .clang-format
    * 修改这个文件，将这个文件放在home目录（全局），或放在项目根目录（项目特有的）
    * clang-format的菜单选择file
    * 如果clang-format的菜单选择"Enable Format on Save"，就会在每次保存的自动格式化，简直太方便了
    ![clang-format](/images/articles/ClangFormat-Xcode.png)

1. [Auto-Importer](https://github.com/lucholaf/Auto-Importer-for-Xcode)

    自动引入头文件（需要选择类名，然后按下 ⌘ + ctrl + H）

1. [Backlight](https://github.com/limejelly/Backlight-for-XCode)

    高亮当前行

