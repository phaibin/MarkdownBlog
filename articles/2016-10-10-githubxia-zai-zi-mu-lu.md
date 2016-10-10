---
title: Github下载子目录
date: 2016-10-10 15:13
---
Github官网并没有提供这种功能，只能从根目录下载整个项目，这是git的特性决定的。现在git提供了`sparse checkout`功能，但是步骤太麻烦了。

还好Github还可以通过svn来访问，所以还可以通过这样的命令来下载：

    svn export https://github.com/username/projectname/trunk/pathname local-dir-name

另外有两个在线工具可以使用：[GitZip](http://kinolien.github.io/gitzip)，[DownGit](https://minhaskamal.github.io/DownGit)。
