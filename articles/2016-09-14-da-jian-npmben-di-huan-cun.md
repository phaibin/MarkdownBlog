---
title: 搭建npm本地缓存
date: 2016-09-14 16:21
---
参考：<http://www.wusisu.com/2016/05/27/2016-05-27-build-a-npm-source-mirror/>

npm和gem完全不一样，项目用到的库每个项目都要装一遍，而react生态里面每个项目用到的库动辄就要上千，所以不管用国内的镜像还是翻墙用官方的都是需要一定时间的。对于初学者经常建立项目的时候，很多重复的库每次都要重新装一遍，真的是一件非常蛋疼的事情。所以如果能在本地建立npm的镜像，就会非常方便了。

搜索了一番，最后参考上面的文章搭建了一个比较完美的环境。这个方案使用的是：[local-npm](https://github.com/nolanlawson/local-npm)。local-npm其实是所谓的skim镜像，就是只有metadata的部分，不包括二进制文件，总共大概1G。

手动创建的步骤是这样的：

- npm install -g local-npm
- 运行local-npm来启动，然后local-npm就会在启动目录建立缓存，这个进程比较慢，log里会显示进行到多少了
- 浏览器打开`http://localhost:5080/_browse/`可以查看本地缓存的库
- npm set registry http://127.0.0.1:5080，改变npm源，可以用npmrc或nrm来管理源

另外有一个全自动安装的脚本：[local-npm-launch-agent](https://github.com/nolanlawson/local-npm-launch-agent)，运行：curl -sL https://raw.githubusercontent.com/nolanlawson/local-npm-launch-agent/master/script.py | python -。

这个脚本会安装好local-npm，然后用pm2来启动，再用npmrc来切换source。local-npm的工作目录在：~/.local-npm。

当local-npm建立好，并且缓存下载好之后，再运行npm install就会感觉飞起来了。如果有二进制文件，在第一次安装的时候也会缓存下来。

如果把local-npm装在一台服务器上，全公司一起访问，这样才是利用率最高的方式，这样节省下来的就是很可观的时间了。