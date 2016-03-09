---
title: Objective-C中float在JSON处理中的陷阱
date: 2013-06-26 10:28
---
今天发现了一个很不容易发现的bug。我调用的接口在发post请求的时候需要把参数dictionary转成JSON字符串，然后做一次MD5加密加到URL中，dictionary是这样的
    
    {@“ordamt”:@(1711.2)}

可是转成JSON之后变成了

    {“ordamt”:1711.199951171875}

大家看到这个应该都明白是float的不精确性造成的。转换调用的是JSONKit库，版本已经是最新的了。开始以为是JSONKit的bug，到JSONKit里面找发现还真有人提这个issue：<https://github.com/johnezang/JSONKit/issues/80>。然后他提到调用系统的库也是一样的。

到底怎么修复这个问题暂时不管了，最靠谱的办法应该还是把float值转成string，再转成JSON。于是我改成了这样：

    {@“ordamt”:[NSString stringWithFormat:@"%f", 1711.2]}

结果打印这个dictionary发现变成了这样：

    {“ordamt”:“1711.199951171875”}

所以单纯这么转换还是一样的。经过试验下面两种方法是可行的：

    {@“ordamt”:[@(1711.2) stringValue]}
    {@“ordamt”:[NSString stringWithFormat:@"%@", @(1711.2)]}

