---
layout: post
title: Silverlight Unit test Template
date: 2010-05-25 14:22
categories:
- .NET
tags: []
published: true
comments: true
---
<p><p>刚刚装了VS2010+Silverlight 4 Tools，想研究一下Silverlight的Unit Test框架，发现这个框架集成到了Silverlight Toolkit中，于是又装上了Toolkit。但是装完之后发现找不到Silverlight Unit Test Template，重装依然不行。于是放狗2个小时，终于找到了答案：</p>  <p><a title="http://silverlight.codeplex.com/WorkItem/View.aspx?WorkItemId=5391" href="http://silverlight.codeplex.com/WorkItem/View.aspx?WorkItemId=5391">http://silverlight.codeplex.com/WorkItem/View.aspx?WorkItemId=5391</a></p>  <p>唉，整了半天是这个Toolkit的bug，真是让我好找。原因是Template会默认安装到C盘，而我的VS装到了D盘，所有就认不到。解决方法就是到</p>  <blockquote>   <p>C:Program FilesMicrosoft Visual Studio 10.0Common7IDEProjectTemplatesCSharpSilverlight1033</p> </blockquote>  <p>找到Silverlight Unit Test Project.zip这个文件，复制到</p>  <blockquote>   <p>我的文档Visual Studio 2010TemplatesProjectTemplatesVisual C#Silverlight</p> </blockquote>  <p>下面。还有一个Item Template，位置在</p>  <blockquote>   <p>C:Program FilesMicrosoft Visual Studio 10.0Common7IDEItemTemplatesCSharpSilverlight1033</p> </blockquote>  <p>把Silverlight Unit Test Class.zip文件复制到</p>  <blockquote>   <p>我的文档Visual Studio 2010TemplatesItemTemplatesVisual C#Silverlight</p> </blockquote>  <p>下面。然后新建项目的时候，在Silverlight下面就会出现一个“Silverlight Unit Test Application”。</p>  <p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/SilverlightUnittestTemplate_CA14/image_4.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/SilverlightUnittestTemplate_CA14/image_thumb_1.png" width="873" height="484" /></a> </p>  <p>而在添加新建项的时候会多出一个“Silverlight Test Class”的选择。</p>  <p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/SilverlightUnittestTemplate_CA14/image_6.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/SilverlightUnittestTemplate_CA14/image_thumb_2.png" width="855" height="458" /></a></p></p>
