---
title: Mountain Lion上安装ruby-oci8 gem
date: 2013-05-30 10:55
---
要用ruby连接oracle需要安装ruby-oci8这个gem。而装这个gem之前需要先安装Oracle Instant Client。主要参考这篇文章：

<http://blog.rayapps.com/2009/09/06/how-to-setup-ruby-and-oracle-instant-client-on-snow-leopard/>

首先下载 [Oracle Instant Client](http://www.oracle.com/technetwork/cn/topics/intel-macsoft-102027-zhs.html)，如果是64位的ruby需要安装64位的Instant Client，32位的则安装32位的Instant Client。64位的系统安装32位的Instant Client不会出错，sqlplus也可以运行，但是编译ruby-oci8的时候就会出问题了。

我安装的版本是11.2.0.3.0。

1. 下载Basic、SDK、SQLPlus这三个组件，然后解压到同一个目录下面，比如我的是/Applications/Oracle/instantclient_11_2
2. 切换到这个目录下面，运行

        sudo ln -s libclntsh.dylib.11.1 libclntsh.dylib
        sudo ln -s libocci.dylib.11.1 libocci.dylib

3. 在这个目录下建立network/admin目录，把你的tnsnames.ora文件放到network/admin目录里面，不明白tnsnames.ora为何物的同学问一下Oracle管理员好了
4. 在.bash_profile文件里面加上：

        # oracle Paths
        export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/Applications/Oracle/instantclient_11_2"
        export TNS_ADMIN="/Applications/Oracle/instantclient_11_2/network/admin"
        export PATH="$PATH:/Applications/Oracle/instantclient_11_2:/Applications/Oracle/instantclient_11_2/bin"
        export SQLPATH="/Applications/Oracle/instantclient_11_2"
        export ORACLE_HOME="/Applications/Oracle/instantclient_11_2"
        export NLS_LANG="AMERICAN_AMERICA.UTF8"

    NLS_LANG环境变量是设置Oracle Instant Client的编码
5. 在命令行下面用`sqlplus username/password@hote:port/sid`验证一下安装是否正确
6. gem install ruby-oci8。对，就是这么简单，什么参数都不需要。当折腾了半天ruby-oci8提示安装成功的时候真的不敢相信
7. 用`ruby -r oci8 -e "OCI8.new('scott', 'tiger').exec('select * from emp') do |r| puts r.join(','); end"`验证一下是否安装成功

---

ps: 如果在Linux上面安装Instant Client，步骤稍微有一点区别：  

2.这里面的两个命令换成：
    sudo ln -s libclntsh.so.11.1 libclntsh.so
    sudo ln -s libocci.so.11.1 libocci.so
4.export DYLD_LIBRARY_PATH这句换成：
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/Applications/Oracle/instantclient_11_2"