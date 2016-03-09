---
title: Rails下面给Model加注释
date: 2013-12-06 13:43
---
Rails里面的Model不需要写字段，有一个问题就是自己也搞不清楚到底有哪些字段。

有一个gem叫[annotate](https://github.com/ctran/annotate_models)，可以用来在Model文件里面生成字段的注释。加了注释之后会是这个样子：

![annotate](/images/articles/rails_annotate.png)

运行`rails g annotate:install`会生成一个名为`auto_annotate_models.rake`的配置文件。里面有一些参数可以配置。

在项目目录下运行`annotate`就会给所有的Model生成注释。

在我使用的Rails 4和annotate 2.6.0下，运行`rake db:migrate`并不会自动给Model加注释，这应该是个bug。有人提供的修复是：在`auto_annotate_models.rake`文件的最下面，end之前，加上下面的语句：

    # Annotate models
    task :annotate do
      puts 'Annotating models...'
      system 'bundle exec annotate'
    end

    # Run annotate task after db:migrate
    #  and db:rollback tasks
    Rake::Task['db:migrate'].enhance do
      Rake::Task['annotate'].invoke
    end

    Rake::Task['db:rollback'].enhance do
      Rake::Task['annotate'].invoke
    end