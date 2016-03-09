---
title: iphone中改变全局字体
date: 2014-02-08 16:36
tag: iphone
---
有的时候项目中需要用一种新的字体，方法是：

在info.plist文件中加入一个Array类型："Fonts provided by application"，里面加入一个String的Item，值为字体文件的名字，比如"微软雅黑.ttf"。

然后你就可以在代码中用[UIFont fontWithName:size:]方法来使用自定义的字体。Name参数的值为真正的字体名，不是字体文件的名字。要准确获取这个名字，可以在系统程序"Font Book"中查看。

![iphone font](/images/articles/iphone_font.png)

但是有一个问题，xib里面是没有办法选择自定义字体的。然后我搜索到了这么一个项目：[FontReplacer](https://github.com/0xced/FontReplacer)。

这个项目的代码写的很巧妙。它的使用方法是先在info.plist中增加一个Dictionary，将要替换的字体和替换之后的字体列出来。然后在"UIFont+Replacement"这个Getegory里面，通过运行时方法将UIFont的几个方法替换为自定义的方法。被替换的方法有：fontWithName:size:，fontWithDescriptor:size:。当程序调用到这几个方法的时候，会自动转到自定义的方法里面，于是就实现了字体替换。不得不说objc的运行时还是很强大的。

我所做的配置是将系统的"HelveticaNeue"字体对应到新加入的字体上面，然后在xib里面只要将字体改为"HelveticaNeue"，或者在代码中用[UIFont fontWithName:size:]传入"HelveticaNeue"。

我曾经试过在"UIFont+Replacement"这个Category里面把[UIFont systemFontWithSize:]方法也替换掉，但是这样做的威力太大了，就连iphone状态栏上面的文字都变了，显然不合适。

在加入这个Category之后，我在提交公司项目的时候，Application Loader报了一个警告，提示引用了私用API。就是这个方法：fontWithName:size:traits:。我查了一下还真的是私有API。还好及时检查出来了，不然又要折腾很久了。这个方法对于iOS7完全不起作用，如果你的项目只兼容iOS7可以直接删掉。但是在iOS6下面没有这个方法就不起作用了。所以这个项目的适用范围还是很窄的。我的修改可以参看我的fork：<https://github.com/phaibin/FontReplacer>。关于这个方法的讨论请参照其中的一个issue：<https://github.com/0xced/FontReplacer/pull/6>。

现在这个项目的最新版本中作者已经移除了所有代码，估计是他感觉里面应用了私有API，感觉不太好的原因。不过你还是可以从commit历史里面查看之前的代码。作者建议大家使用他写的另外一个软件：[MoarFonts](http://pitaya.ch/moarfonts/)。这个软件很诱人，可以直接从Xcode中使用外部加载的字体，可惜他不再奉行开源精神，一份收10$。

另外Github上面还有另外一个实现类似功能的项目：<https://github.com/deni2s/IBCustomFonts>，好像也不错，不过我还没有试。