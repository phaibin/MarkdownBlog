---
layout: post
title: iPhone Memory Debugging with NSZombie and Instruments（转）
date: 2011-10-28 09:09
categories:
- iphone
tags:
- iphone
- 调试
published: true
comments: true
---
原文：<http://www.markj.net/iphone-memory-debug-nszombie/>

打开项目点击Profile，选择Allocations，先点停止，把选项里面的“Enable NSZombie”和“Record Reference Counts”都选上。下一步很关键，选择菜单Instrument->Delete Run 1...。如果不把这个run删掉就重新开始，Instrument会没有反应，或者过很久才有反应。你会发现Allocations下面有两个Run。估计是跑了两个Run所以反应不过来了。不知道是不是我自己的特例。

删掉之后再点Record，然后开始操作你的程序，直到程序崩溃。这时Allocations的进度条上会出现一个红三角。点击说明文字后面的箭头，出现出错的堆栈和内存分配的历史，找到程序出问题的地方。

![instruments](http://phaibin.tk/wp-content/uploads/2011/10/instruments.png)

例子中的程序是这样的：

    @implementation ZombieDebugViewController

    @synthesize objArray;

    -(void)rewriteText {
    NSMutableString* s = [NSMutableString stringWithCapacity:100];
    for (id obj in objArray) {
    [s appendFormat:@"%@,\n",obj];
    [obj release];
    }
    label.text = s;
    }

    - (void)viewDidLoad {
    [super viewDidLoad];
    self.objArray = [NSMutableArray arrayWithCapacity:10];
    [objArray addObject:@"I'm a string object"];
    [self rewriteText];
    }

    -(IBAction) tapButton:(id)button {
    NSNumber* n = [NSNumber numberWithLong:random()];
    [objArray addObject:n];
    [self rewriteText];
    }

    -(void)dealloc {
    [super dealloc];
    self.objArray=nil;
    }

    @end

说实话Instrument里面的那些参数是什么意思我还不是太明白，还需要多用用才能领会。
