---
layout: post
title: Mac调整命令行的显示
date: 2011-08-20 14:09
categories:
- Mac
tags: []
published: true
comments: true
---
<p><p style="font:12px 'Heiti SC Light';margin:0;">默认情况下，<span style="font:12px Monaco;">mac terminal</span>输出是没有颜色的，为了让输出有颜色，需要特别的设置，如果<span style="font:12px Monaco;">shell</span>是<span style="font:12px Monaco;">bash</span>，需要在<span style="font:12px Monaco;">home</span>文件夹下建立<span style="font:12px Monaco;">.bash_profile</span>文件，内容为：</p>
<p style="font:12px Monaco;margin:0;">alias ls='ls -G'</p>
<p style="font:12px Monaco;margin:0;">export PS1="u@W$ "</p>
<p style="font:12px Monaco;margin:0;">export CLICOLOR=1</p>
<p style="font:12px Monaco;margin:0;">export LSCOLORS=ExFxCxDxBxegedabagacad</p>
<p style="font:12px Monaco;margin:0;">export EDITOR=/usr/bin/vi</p>
<p style="font:12px Monaco;margin:0;">export LC_ALL=en_US.UTF-8</p>
<p style="font:12px Monaco;margin:0;">export LANG=en_US.UTF-8</p>
<p style="font:12px Monaco;margin:0;">export PYTHONSTARTUP=~/.pythonstartup</p>
<p style="font:12px Monaco;margin:0;">export MANPATH="/usr/local/man:$MANPATH"</p>
<p style="font:12px Monaco;margin:0;">alias mr='./manage.py runserver'</p>
<p style="font:12px Monaco;margin:0;">alias ms='./manage.py syncdb'</p>
<p style="font:12px Monaco;margin:0;">alias mvm='./manage.py validate'</p>
<p style="font:12px Monaco;margin:0;">alias hu='hg pull -u'</p>
<p style="font:12px Monaco;min-height:16px;margin:0;"> </p>
<p style="font:12px Monaco;margin:0;">export RUBYOPT=rubygems</p>
<p style="font:12px Monaco;margin:0;">export PATH=/usr/local/bin:/usr/local/sbin/:$PATH</p>
<p style="font:12px 'Heiti SC Light';margin:0;"><span style="font:12px Monaco;">PS1</span>让命令行提示显示用户和当前路径，第三和第四行让<span style="font:12px Monaco;">terminal</span>输出显示颜色，默认编辑器设为<span style="font:12px Monaco;">vi</span>，编码设置为<span style="font:12px Monaco;">utf-8</span>，最后为<span style="font:12px Monaco;">PATH</span>和<span style="font:12px Monaco;">MANPATH</span>。</p></p>
