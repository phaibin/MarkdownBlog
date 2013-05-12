---
layout: post
title: Redmine中版本库的设置
date: 2010-06-06 10:36
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>Subversion的主页在这里：<a title="http://subversion.tigris.org/servlets/ProjectDocumentList?folderID=8100" href="http://subversion.tigris.org/servlets/ProjectDocumentList?folderID=8100" target="_blank">http://subversion.tigris.org/servlets/ProjectDocumentList?folderID=8100</a></p>
<p>安装Subversion和TortoiseSVN。</p>
<p>1. 建立SVN：</p>
<blockquote>
<p>运行：svnadmin create c:svnroot</p>
<p>或者在TortoiseSVN里面选择&#8220;Create Repository here&#8221;，不过TortoiseSVN对应的Subversion版本和安装的Subversion版本可能不一致，这样会造成问题，所以最好还是用Subversion的命令创建。</p></blockquote>
<p>2. 配置SVN：</p>
<blockquote>
<p>修改conf/svnserve.conf文件，改这三行：</p>
<p>anon-access = none <br />auth-access = write <br />password-db = passwd</p>
<p>然后在passwd文件中加入用户。</p></blockquote>
<p>3. 启动SVN服务器：</p>
<blockquote>
<p>包括deamon和service两种方式。deamon的方式：</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; svnserve &#8211;d &#8211;r c:/svnroot</p>
<p>service的方式：</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc create svn binpath= "C:svnbinsvnserve.exe --service -r c:svnroot" displayname= "Subversion Server" depend= Tcpip start= auto</p>
<p>这样通过svn://127.0.0.1/就可以访问了</p></blockquote>
<p>4. 配置Redmine加入版本库的地址，就可以看到了。</p>
<p>ps：如果出现&#8220;No such file or directory - svn list --xml "https://192.168.1.123:8443/svn/Imgserver/trunk/Release//"@HEAD --username xxxx --password xxxx&#8221;这样的错误，是因为svn.exe文件不在path中，加入就好了。</p></p>
