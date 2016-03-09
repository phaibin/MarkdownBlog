---
title: Frank的设置
date: 2013-07-18 17:17
tags:
- frank
- ruby
- ios
---
Frank是一个用cucumber对iOS进行自动化测试的工具，网址是：<http://www.testingwithfrank.com>。

对Frank的配置还是很容易碰到问题的，我就碰到过很多问题。

1. 首先，要先配置好ruby环境，只是这个就不容易了。所以要使用这个工具还是需要点ruby基础的。

2. cd到项目目录，运行`frank setup`。这个命令会在项目目录下面建立Frank目录，还会修改项目文件。如果没有加任何参数，默认会修改项目的Debug配置。

    我的项目里面没有Debug配置，而是一些自定义的配置，比如Chk、Pre这些，所以在运行这个命令的时候报了一个警告。这种情况下Frank目录还是会建立好，但是项目文件就不会修改了。如果不仔细看会发现不了这个问题，还以为已经配置好了。等以后运行出问题就找不到原因了。

    所以我为了不干扰正常的配置文件，单独建立了一个Frank配置，然后运行

        frank setup --build_configuration=Frank

    这样修改的就是Frank配置。

3. 然后运行`frank build`。同样的，这条命令还是会区分项目的不同配置，默认使用Debug配置。所以我需要运行：

        frank build --configuration=Frank

    运行完之后如果显示“BUILD SUCCEEDED”，那就万事大吉。但是我出现过好几种问题，导致Failed：

    - duplicate symbol错误。我碰到一个项目中有一个HTTPConnection类，结果跟Frank中的同名类冲突了。因为Frank在build项目的时候加了-all_load参数，所以会出现这种符号重复的错误。  
    我另外一个项目引用了银联和支付宝的静态库，结果报了duplicate symbol _RC4这种错误。说明两个静态库都有RC4这种类或者常量。这种情况就非常麻烦了。参照这篇文章：<http://atnan.com/blog/2012/01/12/avoiding-duplicate-symbol-errors-during-linking-by-removing-classes-from-static-libraries/>（需要翻墙）。把其中一个库中的同名对象剥离出去才可以。
    - 项目的"Valid Architectures"中没有i386，不记得报的什么错了

4. 如果以上都没问题了就可以运行`frank launch`启动app了。上一步会生成一个名为Frankified的新app，“bundle id”也跟原始的app不同，所以不会覆盖原始的app。

5. 运行`frank inspect`会打开一个网页：<http://localhost:37265>，在这个网页里面显示出app的界面和控件树，写代码的时候会很方便。如果这个网页打开没有反应，一定是前面的某个步骤出了问题。
