---
layout: post
title: iphone国际化
date: 2011-06-21 05:09
categories:
- iphone
tags: []
published: true
comments: true
---
<p>1. 在代码中对于要转换的字符串这么写:<br />
NSLocalizedString<span>(</span><span>@"wen"</span><span>, </span><span>@"comment"</span><span>)</span></p>

<p><span>2. 给项目中增加一个字符串文件，改名为Localizable.strings</span></p>

<p><span>3. 在</span>Localizable.strings文件的属性里，在Localization下面增加要支持的语言，比如中文</p>

<p>4. 在Localizable.strings (Chinese)文件里面加上:<br />
"wen"<span> = </span>"<span>文</span>"<span>;</span>
"xiang"<span> = </span>"<span>祥</span>"<span>;</span></p>

<p>5. 这样，当iphone的语言设为中文后，代码中的字符串就替换为中文的字符串了</p>
