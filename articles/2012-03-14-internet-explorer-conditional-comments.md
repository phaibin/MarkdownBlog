---
layout: post
title: Internet Explorer conditional comments
date: 2012-03-14 15:44
categories:
- RoR
tags: []
published: true
comments: true
---
原来HTML针对IE有一种特殊的写法，可以根据IE的版本输出不同的信息：

    <p class="accent">
    <!--[if IE]>
    According to the conditional comment this is IE<br />
    <![endif]-->
    <!--[if IE 6]>
    According to the conditional comment this is IE 6<br />
    <![endif]-->
    <!--[if IE 7]>
    According to the conditional comment this is IE 7<br />
    <![endif]-->
    <!--[if IE 8]>
    According to the conditional comment this is IE 8<br />
    <![endif]-->
    <!--[if IE 9]>
    According to the conditional comment this is IE 9<br />
    <![endif]-->
    <!--[if gte IE 8]>
    According to the conditional comment this is IE 8 or higher<br />
    <![endif]-->
    <!--[if lt IE 9]>
    According to the conditional comment this is IE lower than 9<br />
    <![endif]-->
    <!--[if lte IE 7]>
    According to the conditional comment this is IE lower or equal to 7<br />
    <![endif]-->
    <!--[if gt IE 6]>
    According to the conditional comment this is IE greater than 6<br />
    <![endif]-->
    <!--[if !IE]> -->
    According to the conditional comment this is not IE<br />
    <!-- <![endif]-->
    </p>

这种写法真的很神奇。平时用应该只需要判断是不是IE就可以了。HAML写法：

    /[if IE]
      %a{ :href => 'http://www.mozilla.com/en-US/firefox/' }
        %h1 Get Firefox
