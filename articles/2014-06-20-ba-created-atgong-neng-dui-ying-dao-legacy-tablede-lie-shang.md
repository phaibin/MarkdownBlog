---
title: "把created_at功能对应到legacy table的列上"
date: 2014-06-20 10:09
---
参考：<http://stackoverflow.com/a/9120752>
说实话这个问题很难用一句话表述。Rails会自动创建created_at和updated_at字段，自动写入这两个字段的值。但是对于老旧的数据库，这两个字段或者没有，或者名字不同。下面说的方法就是针对名字不同的表实现created_at和updated_at的功能。

1. 在config/initializers/下面加入一个初始化文件，里面加入：
  
        require 'rails_ext/active_record'

1. 建立lib/rails_ext/active_record.rb文件：
    
        module ActiveRecord
          module Timestamp
            private
            def timestamp_attributes_for_update #:nodoc:
              [:modified_time, :updated_at, :updated_on, :modified_at]
            end
            def timestamp_attributes_for_create #:nodoc:
              [:created_date, :created_at, :created_on]
            end
          end
        end

   把目前的列名加进入，比如created_date，这样created_date也会被当做created_at字段来处理