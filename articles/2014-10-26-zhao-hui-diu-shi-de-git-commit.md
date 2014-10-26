---
title: "找回丢失的Git Commit"
date: 2014-10-26 12:16
---
今天操作Git发生了很惊悚的事情。

修改完提交发现是在branch上面，然后想切换回master合并代码，切换回master之后发现branch没了！瞬间冷汗就下来了，辛辛苦苦一上午的成果很有可能就没有了。

还好Google了一下，发现了解决的办法。

运行这个命令：

    git fsck --lost-found

会显示一些丢失的commit，然后用git show xxxx，查看是不是你刚才的提交。找到这个commit就可以想办法恢复代码了。
