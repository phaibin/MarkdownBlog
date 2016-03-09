---
layout: post
title: 压缩数据库日志
date: 2010-02-21 09:19
categories:
- .NET
tags: []
published: true
comments: true
---
<p><p>SQL Server 2005:</p>  <p>DUMP TRANSACTION 库名 WITH NO_LOG    <br />DBCC SHRINKDATABASE(库名)</p>  <p>Sql Sever 2008:</p>  <pre>USE [master]
GO
ALTER DATABASE DNName SET RECOVERY SIMPLE WITH NO_WAIT
GO
ALTER DATABASE DNName SET RECOVERY SIMPLE   --简单模式
GO
USE DNName
GO
DBCC SHRINKFILE (N'DNName_Log' , 11, TRUNCATEONLY)
GO
USE [master]
GO
ALTER DATABASE DNName SET RECOVERY FULL WITH NO_WAIT
GO
ALTER DATABASE DNName SET RECOVERY FULL  --还原为完全模式
GO</pre></p>
