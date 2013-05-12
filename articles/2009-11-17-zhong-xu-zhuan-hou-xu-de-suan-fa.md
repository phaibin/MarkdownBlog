---
layout: post
title: 中序转后序的算法
date: 2009-11-17 10:50
categories:
- 算法
tags: []
published: true
comments: true
---
<p><p>平常所使用的表达式，主要是将操作数放在运操作数的两旁，例如a+b/d这样的式子，这称之为中序（Infix）表示式，对于人类来说，这样的式子很容易理解，但由于计算机执行指令时是有顺序的，遇到中序表示式时，无法直接进行运算，而必须进一步判断运算的先后顺序，所以必须将中序表示式转换为另一种表示方法。 </p>  <p>可以将中序表示式转换为后序（Postfix）表示式，后序表示式又称之为逆向波兰表示式（Reverse polish notation），它是由波兰的数学家卢卡谢维奇提出，例如(a+b)*(c+d)这个式子，表示为后序表示式时是ab+cd+*。</p>  <p>用手算的方式来计算后序式相当的简单，将运算子两旁的操作数依先后顺序全括号起来，然后将所有的右括号取代为左边最接近的运算子（从最内层括号开始），最后去掉所有的左括号就可以完成后序表示式，例如： </p>  <p>a+b*d+c/d&#160;&#160; =&gt;&#160;&#160;&#160; ((a+(b*d))+(c/d)) -&gt; abd*+cd/+ </p>  <p>如果要用程序来进行中序转后序，则必须使用堆栈，算法很简单，直接叙述的话就是使用循环，取出中序式的字符，遇操作数直接输出；堆栈运算子与左括号；堆栈中运算子优先级大于读入的运算子优先级的话，直接输出堆栈中的运算子，再将读入的运算子置入堆栈；遇右括号输出堆栈中的运算子至左括号。</p>  <p>例如(a+b)*(c+d)这个式子，依算法的输出过程如下： </p>  <p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/f443a708056f_9806/image_2.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/f443a708056f_9806/image_thumb.png" width="338" height="278" /></a></p>  <p>Python代码：</p>  <div style="float:none;margin:0;padding:0;" id="scid:57F11A72-B0E5-49c7-9094-E3A15BD5B5E6:43dfa97e-7517-4b8d-a740-acb5392619c6" class="wlWriterEditableSmartContent"><pre><span style="color:#0000FF;">def</span><span style="color:#000000;"> priority(op):
    </span><span style="color:#0000FF;">if</span><span style="color:#000000;"> op </span><span style="color:#0000FF;">in</span><span style="color:#000000;"> [</span><span style="color:#800000;">'</span><span style="color:#800000;">+</span><span style="color:#800000;">'</span><span style="color:#000000;">, </span><span style="color:#800000;">'</span><span style="color:#800000;">-</span><span style="color:#800000;">'</span><span style="color:#000000;">]:
        </span><span style="color:#0000FF;">return</span><span style="color:#000000;"> </span><span style="color:#000000;">1</span><span style="color:#000000;">
    </span><span style="color:#0000FF;">elif</span><span style="color:#000000;"> op </span><span style="color:#0000FF;">in</span><span style="color:#000000;"> [</span><span style="color:#800000;">'</span><span style="color:#800000;">*</span><span style="color:#800000;">'</span><span style="color:#000000;">, </span><span style="color:#800000;">'</span><span style="color:#800000;">/</span><span style="color:#800000;">'</span><span style="color:#000000;">]:
        </span><span style="color:#0000FF;">return</span><span style="color:#000000;"> </span><span style="color:#000000;">2</span><span style="color:#000000;">
    </span><span style="color:#0000FF;">else</span><span style="color:#000000;">:
        </span><span style="color:#0000FF;">return</span><span style="color:#000000;"> 0</span></pre></div></p>

<p><span style="color:#0000FF;">def</span><span style="color:#000000;"> toPostfix(infix):<br />
    stack </span><span style="color:#000000;">=</span><span style="color:#000000;"> [</span><span style="color:#800000;">''</span><span style="color:#000000;">]<br />
    buffer </span><span style="color:#000000;">=</span><span style="color:#000000;"> []<br />
    </span><span style="color:#0000FF;">for</span><span style="color:#000000;"> c </span><span style="color:#0000FF;">in</span><span style="color:#000000;"> infix:<br />
        </span><span style="color:#0000FF;">if</span><span style="color:#000000;"> c </span><span style="color:#000000;">==</span><span style="color:#000000;"> </span><span style="color:#800000;">'</span><span style="color:#800000;">(</span><span style="color:#800000;">'</span><span style="color:#000000;">:<br />
            stack.append(c)<br />
        </span><span style="color:#0000FF;">elif</span><span style="color:#000000;"> c </span><span style="color:#0000FF;">in</span><span style="color:#000000;"> </span><span style="color:#800000;">"</span><span style="color:#800000;">+-*/</span><span style="color:#800000;">"</span><span style="color:#000000;">:<br />
            </span><span style="color:#0000FF;">while</span><span style="color:#000000;"> priority(stack[</span><span style="color:#000000;">-</span><span style="color:#000000;">1</span><span style="color:#000000;">]) </span><span style="color:#000000;">&gt;=</span><span style="color:#000000;"> priority(c):<br />
                buffer.append(stack.pop())<br />
            stack.append(c)<br />
        </span><span style="color:#0000FF;">elif</span><span style="color:#000000;"> c </span><span style="color:#000000;">==</span><span style="color:#000000;"> </span><span style="color:#800000;">'</span><span style="color:#800000;">)</span><span style="color:#800000;">'</span><span style="color:#000000;">:<br />
            </span><span style="color:#0000FF;">while</span><span style="color:#000000;"> stack[</span><span style="color:#000000;">-</span><span style="color:#000000;">1</span><span style="color:#000000;">] </span><span style="color:#000000;">!=</span><span style="color:#000000;"> </span><span style="color:#800000;">'</span><span style="color:#800000;">(</span><span style="color:#800000;">'</span><span style="color:#000000;"> </span><span style="color:#000000;">&amp;&amp;</span><span style="color:#000000;"> stack[</span><span style="color:#000000;">-</span><span style="color:#000000;">1</span><span style="color:#000000;">] </span><span style="color:#000000;">!=</span><span style="color:#000000;"> </span><span style="color:#800000;">''</span><span style="color:#000000;">:<br />
                buffer.append(stack.pop())<br />
            stack.pop()<br />
        </span><span style="color:#0000FF;">else</span><span style="color:#000000;">:<br />
            buffer.append(c)<br />
    </span><span style="color:#0000FF;">while</span><span style="color:#000000;"> stack[</span><span style="color:#000000;">-</span><span style="color:#000000;">1</span><span style="color:#000000;">] </span><span style="color:#000000;">!=</span><span style="color:#000000;"> </span><span style="color:#800000;">''</span><span style="color:#000000;">:<br />
        buffer.append(stack.pop())<br />
    </span><span style="color:#0000FF;">return</span><span style="color:#000000;"> buffer</span></p>

<p>infix <span style="color:#000000;">=</span><span style="color:#000000;"> </span><span style="color:#800000;">"</span><span style="color:#800000;">(a+b)*(c+d)</span><span style="color:#800000;">"</span><span style="color:#000000;">
</span><span style="color:#0000FF;">print</span><span style="color:#000000;">(toPostfix(infix))
</span><span style="color:#0000FF;">print</span><span style="color:#000000;">(toPrefix(infix))
</span><!-- Code inserted with Steve Dunn's Windows Live Writer Code Formatter Plugin.  http://dunnhq.com --></p>
