---
layout: post
title: 后序转中序的算法
date: 2012-08-07 15:25
categories:
- 算法
tags: []
published: true
comments: true
---
这几天在做一道题，就是将表达式中的多余括号去掉。其实方法就简单，就是先转为后序表达式，然后再转为中序表达式。因为转为后序之后会把所有的括号都去掉，再转为中序就只会加上必要的括号。

中序转后序比较简单，网上的资料也很多，但是后序转中序的资料就很少了。搜索了半天只有几个C语言写的程序，看的头大，算法逻辑就没有人讲的。没办法只好转用英文搜，顺便说下中序和后序的英文分别为：infix, postfix。

YouTube上有两个很好的视频，一个是中序转后序：

[Infix to Postfix Notation - YouTube](http://www.youtube.com/watch?v=rA0x7b4YiMI)

一个是后序转中序：

[Postfix to Infix Notation - YouTube](http://www.youtube.com/watch?v=OlRENYiiIiw)

可以帮助很好的理解算法的步骤。

这里有一个ruby的算法，后序转中序的时候不需要加多余的括号，讲解也比较多，但是就是程序写的有点复杂：[Postfix to Infix](http://www.rubyquiz.com/quiz148.html)

然后我理解了算法之后根据上面的ruby程序写了一个更简单的程序，不需要借助二叉树：

    PREC = {'+' => 0, '-' => 0, '*' => 1, '/' => 1, '%' => 1, '^' => 2}
    stack = []
    expr = '23+4+45-6-*7/9+3^'
    expr.split(//).each do |x|
        case x
        when *%w{+ * - / ^}
            op2 = stack.pop
            op1 = stack.pop
            if op2[1] and (PREC[op2[1]] < PREC[x]) then
                op2 = "(#{op2[0]})"
            else
                op2 = op2[0]
            end
            if op1[1] and (PREC[op1[1]] < PREC[x]) then
                op1 = "(#{op1[0]})"
            else
                op1 = op1[0]
            end
            stack.push ["#{op1} #{x} #{op2}", x]
        else
            stack.push [x]
        end
    end
    puts stack.pop[0]
