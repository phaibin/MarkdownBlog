Mac上面看图片我一直使用Xee，但是Xee已经很多年没有更新了，在新版的macOS里面有很多图片会报错打不开。

尝试了很多其他的软件都有各种各样的问题，都不是很好用，于是决心自己写一个。

我做的这个App叫[MoliView](https://apps.apple.com/cn/app/moliview-image-viewer/id6502892357?l=en-GB&mt=12)。界面与Xee是一致的。

![](/images/moliview_1.png)

最基本的几个操作也与Xee一致，为了简单起见，省略了快捷键的设置界面，固定了几个常用操作的快捷键，相信熟悉Xee的人也能很快熟悉这些快捷键。

![](/images/moliview_2.png)

- 空格：切换图片
- =、-：放大缩小
- /：实际大小
- 8：根据屏幕调整大小
- R：旋转90°
- F：全屏
- L：在Finder中显示
- cmd+c：copy图片到剪贴板
- cmd+delete：删除图片

支持常用的一些图片格式，包括gif和svg。

图片打开默认是以适应屏幕的方式来显示的。

支持多窗口，方便对比图片。

支持显示Exif：
![](/images/moliview_3.png)

支持打印：
![](/images/moliview_4.png)

我发现很多图片浏览软件虽然做了打印，但是都没有图片缩放的选项，这个Xee就做的很好。

可惜上架Mac App Store需要打开沙箱，这样的话就不能设置App为默认程序，只能手动设置，有点不太方便。