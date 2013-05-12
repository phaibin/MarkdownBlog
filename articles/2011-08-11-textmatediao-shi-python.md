---
layout: post
title: Textmate调试Python
date: 2011-08-11 01:57
categories:
- Python
tags: []
published: true
comments: true
---
<p><p>要让Textmate调试Python的时候在光标停在编辑器里面，类似XCode的效果，需要安装PdbTextMateSupport。方法是：</p>
<pre style="font-family:Inconsolata, 'Lucida Console', 'Andale Mono', Monaco, Courier;margin:0;padding:.4em;">sudo easy_install PdbTextMateSupport</pre>
<p><span style="font-family:Inconsolata, 'Lucida Console', 'Andale Mono', Monaco, Courier;">这会安装相关的模块。然后你需要让pdb知道Textmate，这命令行运行：</span></p>
<pre style="font-family:Inconsolata, 'Lucida Console', 'Andale Mono', Monaco, Courier;margin:0;padding:.4em;">pdbtmsupport enable</pre>
<p>这个命令的原理是建立~/.pdbrc文件，然后在里面加入：</p>
<p>
<p>from PdbTextMateSupport import preloop, precmd</p>
<p>pdb.Pdb.preloop = preloop</p>
<p>pdb.Pdb.precmd = precmd</p>
<p>但是我之后调试出错，在这个文件前面加上"import pdb"就好了。</p>
</p>
<p><span style="font-family:Inconsolata, 'Lucida Console', 'Andale Mono', Monaco, Courier;">然后在Textmate里面设置，勾选“Highlight current line”。</span></p>
<div id="_mcePaste" class="mcePaste" style="width:1px;height:1px;">
<div id="_mcePaste" class="mcePaste" style="width:1px;height:1px;">from PdbTextMateSupport import preloop, precmd</div>
<div id="_mcePaste" class="mcePaste" style="width:1px;height:1px;">pdb.Pdb.preloop = preloop</div>
<div id="_mcePaste" class="mcePaste" style="width:1px;height:1px;">pdb.Pdb.precmd = precmd</div>
</div></p>
