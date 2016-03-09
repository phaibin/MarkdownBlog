---
layout: post
title: 正确的处理SQL Server日志的方法(转)
date: 2008-11-04 16:26
categories:
- .NET
tags: []
published: true
comments: true
---
<p><span style="color:#3366ff;font-family:宋体;"><span style="color:red;"><span style="color:#000000;"><span style="color:#000000;">压缩日志及数据库文件大小<br />
<br />
/*--特别注意<br />
<br />
请按步骤进行,未进行前面的步骤,请不要做后面的步骤<br />
否则可能损坏你的数据库。<br />
<br />
一般不建议做第4,6两步<br />
第4步不安全,有可能损坏数据库或丢失数据<br />
第6步如果日志达到上限,则以后的数据库处理会失败,在清理日志后才能恢复.<br />
--*/<br />
<br />
--下面的所有库名都指你要处理的数据库的库名<br />
<br />
1.清空日志<br />
DUMP TRANSACTION 库名 WITH NO_LOG&#160;<br />
<br />
2.截断事务日志：<br />
BACKUP LOG 库名 WITH NO_LOG<br />
<br />
3.收缩数据库文件(如果不压缩,数据库的文件不会减小<br />
企业管理器--右键你要压缩的数据库--所有任务--收缩数据库--收缩文件<br />
--选择日志文件--在收缩方式里选择收缩至XXM,这里会给出一个允许收缩到的最小M数,直接输入这个数,确定就可以了<br />
--选择数据文件--在收缩方式里选择收缩至XXM,这里会给出一个允许收缩到的最小M数,直接输入这个数,确定就可以了<br />
<br />
也可以用SQL语句来完成<br />
--收缩数据库<br />
DBCC SHRINKDATABASE(库名)<br />
<br />
--收缩指定数据文件,1是文件号,可以通过这个语句查询到:select * from sysfiles<br />
DBCC SHRINKFILE(1)<br />
<br />
4.为了最大化的缩小日志文件(如果是sql 7.0,这步只能在查询分析器中进行)<br />
a.分离数据库:<br />
企业管理器--服务器--数据库--右键--分离数据库<br />
<br />
b.在我的电脑中删除LOG文件<br />
<br />
c.附加数据库:<br />
企业管理器--服务器--数据库--右键--附加数据库<br />
<br />
此法将生成新的LOG，大小只有500多K<br />
<br />
或用代码：&#160;<br />
下面的示例分离 pubs，然后将 pubs 中的一个文件附加到当前服务器。<br />
<br />
a.分离<br />
EXEC sp_detach_db @dbname = '库名'<br />
<br />
b.删除日志文件<br />
<br />
c.再附加<br />
EXEC sp_attach_single_file_db @dbname = '库名',&#160;<br />
@physname = 'c:Program FilesMicrosoft SQL ServerMSSQLData库名.mdf'<br />
<br />
5.为了以后能自动收缩,做如下设置:<br />
企业管理器--服务器--右键数据库--属性--选项--选择"自动收缩"<br />
<br />
--SQL语句设置方式:<br />
EXEC sp_dboption '库名', 'autoshrink', 'TRUE'<br />
<br />
6.如果想以后不让它日志增长得太大<br />
企业管理器--服务器--右键数据库--属性--事务日志<br />
--将文件增长限制为xM(x是你允许的最大数据文件大小)<br />
<br />
--SQL语句的设置方式:<br />
alter database 库名 modify file(name=逻辑文件名,maxsize=20)</span></span></span></span></p>
