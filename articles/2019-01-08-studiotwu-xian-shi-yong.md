---
title: Studio 3T无限试用
date: 2019-01-08 10:53
---
Studio 3T是一个很棒的Mongodb客户端，但是收费很贵，而且没有破解，网上只能找到一个Windows上面重置试用的办法，Mac上面却没有。

于是尝试在Docker里面跑一个Ubuntu版本的Studio 3T，这样到期之后可以通过重建来无限试用。

步骤如下：

1. brew install socat

1. brew cask install xquartz

1. socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

1. 打开另外一个Terminal

    docker run -e DISPLAY=docker.for.mac.host.internal:0 -i -t -d --name s3t --net=host getting2vinod/studio3t:latest /opt/studio3t/Studio-3T
    
1. 关闭之后重新运行：docker start s3t