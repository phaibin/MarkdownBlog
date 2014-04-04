---
title: Git合并多个Commit（转）
date: 2014-04-04 10:27
---
原文：<http://www.708luo.com/?p=17>

假设要合并最后的2个提交，可以按如下命令进行：

1. git rebase –i HEAD~2

    运行完该命令，会出现如下所示内容：

    ![Git Rebase](/images/articles/git_rebase_1.png)

1. 将第二个pick修改为squash或者s，然后输入”:wq”退出。

1. 这时git会自动第二个提交合并到第一个中去。并提示输入新的message（就是我们常说的comments），如下：

    ![Git Rebase](/images/articles/git_rebase_2.png)

1. 编辑输入新的message，然后输入”:wq”退出

1. 此时本地的（HEAD中）最后两次提交已经被合并为一个。git log可以查看。

1. 如果需要提交到远端，运行git push –force origin master即可。