---
title: Android中实现数组的map操作
date: 2016-05-09 14:11
---
参考：<http://winterbe.com/posts/2014/07/31/java8-stream-tutorial-examples/>
<https://medium.com/@nicopasso/java-8-stream-on-android-c629e4237d5f#.n08aud4fr>
<http://blog.soliloquize.org/2015/07/18/在Android-Studio中配置Retrolambda/>

Ruby之类的脚本语言对数组可以实行这样的操作：

    [1,2,3].map {x|x*2}  # => [2,4,6]

就是对每个元素乘与2得到另外一个数组。 这种迭代器方法很方便，很多语言都有实现，而且基本上名字和语法都差不多。

当我想在Android中写这种代码的时候却找不到这种方法。并且在Google中搜索解答都很难，因为搜索"java map"得到的都是java中map数据类型的问题。后来终于让我搜到了，原来java中相应的语法叫Stream，而且还是Java8中才加入的。Java真是不思进取。

首先有一个问题我查了很久才搞明白，就是Android和java版本的关系。我的理解是这样的（不确定对不对）：

- Android由Java编写，由Java编译器来编译
- Android手机上有Java的运行环境，编译之后的Android程序由Android手机上的Java运行环境来运行
- JDK向下兼容，Android程序可以用最新的JDK8来编译，如果代码中只用了Java6的语法，这一点问题都没有
- Android手机上的Java runtime对Java语法的支持程度不同，如果用了比较新的语法在低版本的Android手机上就会出错。
- 所以Android官方的解释：Java7只能在19（4.4）之上的版本运行，而Java8只能在N之上的版本运行，就不难理解了。

Java8中两个比较主要的特性：Lambda和Stream，只能通过第三方的实现在低版本上面运行。

####Lambda

配置：

    # Project build.gradle:
    buildscript {
        dependencies {
            classpath 'com.android.tools.build:gradle:2.1.0'
            classpath 'me.tatarka:gradle-retrolambda:3.2.5'
    }
   
    # app build.gradle:
    apply plugin: 'me.tatarka.retrolambda'

    android {
        compileOptions {
            sourceCompatibility JavaVersion.VERSION_1_8
            targetCompatibility JavaVersion.VERSION_1_8
        }

        retrolambda {
            javaVersion JavaVersion.VERSION_1_6
        }
    }

使用：

    itemView.setOnClickListener(view -> Toast.makeText(getActivity(), "click item", Toast.LENGTH_SHORT).show());

####Stream

配置：

    # app build.gradle:
    dependencies {
        compile 'com.annimon:stream:1.0.9'
    }

使用：

    List<UUID> ids = Stream.of(mCrimes).map(Crime::getId).collect(Collectors.toList());
