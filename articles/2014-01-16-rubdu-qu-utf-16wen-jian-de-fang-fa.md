---
title: Rub读取UTF-16文件的方法
date: 2014-01-16 17:20
---
一种方法是：

    s = File.read('test.txt', encoding:'UTF-16LE', binmode: true)

另一种是：

    s = ''
    File.open('test.txt', 'rb:UTF-16LE') do |f|
      s = f.read
    end

File.read里面的binmode参数就相当于File.open里面mode里面的"b"。

然后可以转换为UTF-8格式：

    s2 = s.encode('UTF-8')
    