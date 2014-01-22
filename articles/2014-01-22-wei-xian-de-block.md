---
title: "危险的block"
date: 2014-01-22 16:47
---
这是项目里面的一段真实代码：

![block 1](/images/articles/block_1.png)

运行完全没有问题。没有任何警告，运行Profile也没有任何问题。但是就是这段代码导致了ViewController无法释放。

原因就是block通过tableModel、actions这些变量被self，也就是ViewController retain了，而block又会retain里面的变量，于是就造成了循环引用。

解决的办法就是：

![block 2](/images/articles/block_2.png)

把block里面的self改成weakSelf。这样self就不会被block引用了。

之前也碰到过这样的问题，XCode有的时候会提示你，有的时候则不会。我也一直没有理解这么做的意义，也没有特别注意block的写法。

![block 3](/images/articles/block_3.png)

上面3种情况，上面两种会有警告，也就是会产生循环引用，下面一种不会。也只有在这么明显的情况下XCode才能检测出问题。

所以，block虽然用起来很方便，还是要警惕这种隐蔽的问题。如果不怕麻烦，就把block里面所有的self都换成weakSelf吧。

我突然想通了一件事，这个不就是闭包么？闭包里面的变量在离开作用范围之后并不会消失，在之后闭包调用的时候依然可以被访问。也就相当于被block retain了一次。