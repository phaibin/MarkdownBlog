---
title: Ruby中动态定义方法
date: 2015-01-20 13:32
---
参考：<http://codeblog.dhananjaynene.com/2010/01/dynamically-adding-methods-with-metaprogramming-ruby-and-python/>

先用代码描述一下我要实现的效果：

    class Class1
      attr_accessor :a

      def a=(value)
        @a = value
        a = @a
        Class2.send(:define_method, 'desc') do
          puts 'Class1'
          puts a
        end
      end
    end

    class Class2
      def desc
        puts 'claas2'
      end
    end

    c1 = Class1.new
    c1.a = 1

    c2 = Class2.new
    c2.desc

我的目的就是希望覆盖Class2的desc方法，使得在里面可以访问到Class1的一个成员变量。当然所用的方法在上面也有体现，就是使用：Class2.send(:define_method, 'desc')。