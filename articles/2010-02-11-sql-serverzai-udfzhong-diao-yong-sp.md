---
layout: post
title: Sql Server在UDF中调用SP
date: 2010-02-11 10:48
categories:
- .NET
tags: []
published: true
comments: true
---
<p><p>先执行EXEC sp_serveroption localserver, 'Data Access', true</p>  <p>函数的写法为：</p>  <p>create Function&#160; testfunction    <br />()&#160;&#160;&#160;&#160; <br />RETURNS int     <br />as     <br />begin     <br />declare @cnt int     <br />select @cnt=2     <br />    <br />declare @temptable table(col int)     <br />insert into @temptable SELECT * FROM OPENQUERY(localserver, 'set nocount on;exec testprocedure;commit')</p>  <p>return @cnt    <br />end&#160;&#160; </p>  <p>localserver是本地的机器名，testprocedure是要执行的存储过程。</p>  <p>如果不加set nocount on，执行存储过程第一句之后就返回了，就算是insert也是一样，set nocount on之后就会执行完整个存储过程。</p>  <p>开始的时候没有加commit，存储过程里面的insert语句总是不执行，返回的查询结果却是正确的，我才明白原来这样执行相当于在一个事务中，加上commit之后就应用到实际的表上面了。</p>  <p>如果想要给存储过程传递参数可以这样写：</p>  <p>declare @sql nvarchar(200)   <br />set @sql='SELECT * FROM OPENQUERY(localserver, ''set nocount on;exec testprocedure '+'2'+';commit'')'    <br />exec sp_executesql @sql</p>  <p>但是这样写在函数中一样不允许，所以在函数中调用带参数的存储过程还是没想到办法。</p></p>
