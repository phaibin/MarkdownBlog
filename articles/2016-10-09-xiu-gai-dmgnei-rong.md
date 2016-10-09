---
title: 修改dmg内容
date: 2016-10-09 12:08
---
先用Disk Utility或者DropDMG的Convert把Read-Only dmg转换为Read-Write dmg。然后就可以编辑里面的内容了。如果dmg大小不够就用Disk Utility的Resize来调整大小。不过很可能Resize会不能用，这时候可以用命令行来调整：

    hdiutil resize -size 25G /PATH/TO/DISK/IMAGE.dmg


