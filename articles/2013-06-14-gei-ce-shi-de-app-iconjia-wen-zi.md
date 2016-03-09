---
title: 给测试的app icon加文字
date: 2013-06-14 17:26
tags:
- iphone
---
参考：<http://chuansong.me/n/38687>  
<http://www.merowing.info/2013/03/overlaying-application-version-on-top-of-your-icon/>

第二个链接里面的文章讲解的很清楚，还提供了代码，我也是基本按照里面的代码来做的。

我再提几个注意的地方：

1. convert的参数：'#0008'是文字背景的颜色，可以根据需要调整，分别是R、G、B、A。
2. 给图标文件加_base和处理的时候去掉_base没有必要，直接用原始的名字也可以
3. "Run Script"这个动作放到"Target Dependencies"的后面，就是需要先处理
4. "Copy Bundle Resources"里面把图标文件去掉。这个步骤很关键，之前试验了很多次，有时可以工作有时不行，就是这个造成的。因为通过脚本已经把处理好的图片放到了app目录里面，再运行"Copy Bundle Resources"就会被原始文件覆盖了一遍。
5. Unix shell有很严格的语法，比如 [ 和 ] 左右都要留有空格，错一点就不工作了

