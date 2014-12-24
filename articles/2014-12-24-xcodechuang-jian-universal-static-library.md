---
title: Xcode创建universal static library
date: 2014-12-24 15:09
---
参考：<http://stackoverflow.com/questions/3520977/build-fat-static-library-device-simulator-using-xcode-and-sdk-4>

Xcode创建一个static library项目，生成出来的.a文件是针对平台的，要么是真机，要么是模拟器。但是发布的时候最好是合并为一个.a文件。一个方法是生成两个平台的文件，然后用lipo手动合并，但是比较麻烦。另外的方法就是这个网页里面提到的方法。

这个方法需要建立一个Run Script的Build Phase，在里面加入网页里面提供的脚本。然后生成完就会在生成目录多出一个“Release-universal”的目录，里面就是universal的.a文件。非常方便。
