---
layout: post
title: Rails console 测试路由(转)
date: 2012-03-06 16:44
categories:
- RoR
tags: []
published: true
comments: true
---
原文：<http://wxianfeng.com/2011/03/02/rails-console-routes>

环境:ruby 1.9.2 + rails 3.0.3

rails console 用起来还是很爽的,路由也可以在console下使用 , 甚至可以 get , post , 下面介绍惯用手法:

1. rake 查看routes

        > rake routes

2. console 下查看 routes

        Rails.application.routes.routes # rails 2.x 使用 ActionController::Routing::Routes.routes

3. 查看 root(routes)

        ruby-1.9.2-p0 > app.root_path
         => "/"
        ruby-1.9.2-p0 > app.root_url
         => "http://www.example.com/"
        ruby-1.9.2-p0 > app.host = "www.wxianfeng.com"
         => "www.wxianfeng.com"
        ruby-1.9.2-p0 > app.root_url
         => "http://www.wxianfeng.com/"

4. 查看资源 路由

        ruby-1.9.2-p0 >   user = User.first
          User Load (0.3ms)  SELECT `users`.* FROM `users` LIMIT 1
         => #<User id: 1, login: "entos", name: "", email: "entos@entos.com", crypted_password: "3dea29b4e40bc9a70bb63678678c5ff37fe49753", salt: "2ec7e5db7f3ce5de61f1add8275b674dbd2770dc", remember_token: nil, remember_token_expires_at: nil, activation_code: nil, activated_at: nil, status: 2, suspend_at: nil, avatar_id: nil, orgunit_id: nil, mobile_phone: nil, last_login_at: nil, language: nil, options: nil, created_at: "2011-03-01 07:42:37", updated_at: "2011-03-01 07:42:37">
        ruby-1.9.2-p0 > app.user_path(user)
         => "/users/1"
        ruby-1.9.2-p0 > app.users_path
         => "/users"
        ruby-1.9.2-p0 > app.new_user_path
         => "/users/new"
        ruby-1.9.2-p0 > app.edit_user_path(:id=>user.id)
         => "/users/1/edit"
        ruby-1.9.2-p0 > app.users_url
         => "http://www.wxianfeng.com/users"

5. 不使用app调用

        ruby-1.9.2-p0 > include ActionController::UrlWriter
         => Object
        ruby-1.9.2-p0 > default_url_options[:host] = "wxianfeng.com"
         => "wxianfeng.com"
        ruby-1.9.2-p0 > users_url
         => "http://wxianfeng.com/users"

6. path 和 route Hash 互转

        ruby-1.9.2-p0 > r = Rails.application.routes
        ruby-1.9.2-p0 > r.generate :controller => "users" , :action=>"new"
         => "/signup"
        ruby-1.9.2-p0 > r.generate :controller => "users" , :action=>"edit" , :id=>1
         => "/users/1/edit"
        ruby-1.9.2-p0 > r.recognize_path "/users/index"
         => {:action=>"show", :controller=>"users", :id=>"index"}
        ruby-1.9.2-p0 > r.recognize_path "/users",:method=>"post"
         => {:action=>"create", :controller=>"users"}

7. get, post

    模拟get访问首页，没登录 然后跳转到了/login ， 然后 post 提交登录 成功

        ruby-1.9.2-p0 > app.class
         => ActionDispatch::Integration::Session
        ruby-1.9.2-p0 > app.get "/"
         => 302
        ruby-1.9.2-p0 > app.controller.params
         => {"controller"=>"welcome", "action"=>"index"}
        ruby-1.9.2-p0 > app.response.redirect_url
         => "http://www.example.com/login"
        ruby-1.9.2-p0 > app.post "/session" , {:login=>"entos",:password=>"netposa"}
          SQL (0.3ms)  SHOW TABLES
          User Load (0.2ms)  SELECT `users`.* FROM `users` WHERE (status = 2) AND (`users`.`login` = 'entos') LIMIT 1
          SQL (0.1ms)  BEGIN
          User Load (0.3ms)  SELECT `users`.* FROM `users` WHERE (`users`.`id` = 1) LIMIT 1
          SQL (0.0ms)  COMMIT
         => 302
        ruby-1.9.2-p0 > app.controller.params
         => {"login"=>"entos", "password"=>"netposa", "action"=>"create", "controller"=>"sessions"}
        ruby-1.9.2-p0 > app.session[:user_id]
         => 1
        ruby-1.9.2-p0 > app.cookies
         => #<Rack::Test::CookieJar:0xb010120 @default_host="www.example.com", @cookies=[#<Rack::Test::Cookie:0x9b726f0 @default_host="www.example.com", @name_value_raw="_ent_os_session=BAh7CEkiD3Nlc3Npb25faWQGOgZFRiIlMzM4ZTdhYzU4OTY3NDhmMmZmMGFhNDkyYTExZWVmOThJIgx1c2VyX2lkBjsARmkGSSIKZmxhc2gGOwBGSUM6JUFjdGlvbkRpc3BhdGNoOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZUkiG0xvZ2dlZCBpbiBzdWNjZXNzZnVsbHkGOwBUBjoKQHVzZWRvOghTZXQGOgpAaGFzaHsA--d8652cbfebcae436e64a824d7ac2f64a81aa6619", @name="_ent_os_session", @value="BAh7CEkiD3Nlc3Npb25faWQGOgZFRiIlMzM4ZTdhYzU4OTY3NDhmMmZmMGFhNDkyYTExZWVmOThJIgx1c2VyX2lkBjsARmkGSSIKZmxhc2gGOwBGSUM6JUFjdGlvbkRpc3BhdGNoOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZUkiG0xvZ2dlZCBpbiBzdWNjZXNzZnVsbHkGOwBUBjoKQHVzZWRvOghTZXQGOgpAaGFzaHsA--d8652cbfebcae436e64a824d7ac2f64a81aa6619", @options={"path"=>"/", "HttpOnly"=>nil, "domain"=>"www.example.com"}>, #<Rack::Test::Cookie:0x9b826f4 @default_host="www.example.com", @name_value_raw="auth_token=", @name="auth_token", @value="", @options={"path"=>"/", "domain"=>"www.example.com"}>]>
        ruby-1.9.2-p0 > app.response.redirect_url
         => "http://www.example.com/"
        ruby-1.9.2-p0 > app.flash
         => {:notice=>"Logged in successfully"}
        ruby-1.9.2-p0 >

    甚至 你还可以 ajax 异步提交

        >> app.xml_http_request "/store/add_to_cart", :id => 1
        => 200

8. 分配一个 实例变量

        >>app.assigns[:foo] = “bar”

SEE

<http://clarkware.com/blog/2006/04/04/running-your-rails-app-headless>  
<http://blog.zobie.com/2008/11/testing-routes-in-rails/>  
<http://railstech.com/2010/06/routes-testing-in-rails/>  
<http://stuartsierra.com/2008/01/08/testing-named-routes-in-the-rails-console>
