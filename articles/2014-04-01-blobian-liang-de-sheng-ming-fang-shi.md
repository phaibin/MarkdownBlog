---
title: Block变量的声明方式
date: 2014-04-01 10:00
---
参考：<http://fuckingblocksyntax.com>

作为临时变量：

    returnType (^blockName)(parameterTypes) = ^returnType(parameters) {...};

作为属性：

    @property (nonatomic, copy) returnType (^blockName)(parameterTypes);

作为方法参数：

    - (void)someMethodThatTakesABlock:(returnType (^)(parameterTypes))blockName;

作为方法调用的参数：

    [someObject someMethodThatTakesABlock: ^returnType (parameters) {...}];

作为typedef：

    typedef returnType (^TypeName)(parameterTypes);
    TypeName blockName = ^returnType(parameters) {...};
