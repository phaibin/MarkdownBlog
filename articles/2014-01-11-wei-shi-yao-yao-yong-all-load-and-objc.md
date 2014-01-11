---
title: 为什么要用-all_load&-ObjC（转）
date: 2014-01-11 15:05
---
每次在加入静态库的时候都会在other linker flag里设置两个值：-all_load和-ObjC。
很奇怪为什么要这样做，而且有的时候什么都不设置也不影响静态库的使用。
所有使用了这个静态库的项目都没有出现任何的问题，即使不设置那两个flag值。

于是拜求G大神，终于找到了结果。
关于-ObjC的：

>This flag causes the linker to load every object file in the library that defines an Objective-C class or category.
While this option will typically result in a larger executable (due to additional object code loaded into the application),
it will allow the successful creation of effective Objective-C static libraries that contain categories on existing classes.

翻译过来是：

>这个flag告诉链接器把库中定义的Objective-C类和Category都加载进来。这样编译之后的app会变大（因为加载了其他的objc代码进来）。
但是如果静态库中有类和category的话只有加入这个flag才行。

关于-all_load的：

>IMPORTANT: For 64-bit and iPhone OS applications, there is a linker bug that prevents -ObjC from loading objects files from static libraries that contain only categories and no classes.
The workaround is to use the -all_load or -force_load flags. -all_load forces the linker to load all object files from every archive it sees, even those without Objective-C code.
-force_load is available in Xcode 3.2 and later. It allows finer grain control of archive loading. Each -force_load option must be followed by a path to an archive,
and every object file in that archive will be loaded.

这个flag是专门处理-ObjC的一个bug的。用了-ObjC以后，如果类库中只有category没有类的时候这些category还是加载不进来。变通方法就是加入-all_load或者-force-load。-all_laod会强制
链接器把目标文件都加载进来，即使没有objc代码。-force_load在xcode3.2后可用。但是-force_load后面必须跟一个只想静态库的路径。

读了以上你明白了吧。
无论如何还是把那两个flag的值都加上吧。这样可以保证你哪天突发奇想加了一堆category什么的oc牛X语法也不至于项目崩溃。

