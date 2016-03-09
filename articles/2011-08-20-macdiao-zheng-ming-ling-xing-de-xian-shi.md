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
默认情况下，mac terminal输出是没有颜色的，为了让输出有颜色，需要特别的设置，如果shell是bash，需要在home文件夹下建立.bash_profile文件，内容为：

    alias ls='ls -G'
    export PS1="u@W$ "
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    export EDITOR=/usr/bin/vi
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    export PYTHONSTARTUP=~/.pythonstartup
    export MANPATH="/usr/local/man:$MANPATH"
    alias mr='./manage.py runserver'
    alias ms='./manage.py syncdb'
    alias mvm='./manage.py validate'
    alias hu='hg pull -u'
 
    export RUBYOPT=rubygems
    export PATH=/usr/local/bin:/usr/local/sbin/:$PATH
    
PS1让命令行提示显示用户和当前路径，第三和第四行让terminal输出显示颜色，默认编辑器设为vi，编码设置为utf-8，最后为PATH和MANPATH。