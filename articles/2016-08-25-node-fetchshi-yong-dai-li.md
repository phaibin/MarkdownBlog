---
title: node-fetch使用代理
date: 2016-08-25 16:44
---
Terminal中设置了代理，可是react项目中使用node-fetch居然不走Terminal的代理，还查了半天错误，真是心塞。

如果要使用代理，需要用：<https://github.com/TooTallNate/node-https-proxy-agent>

    fetch('https://www.google.com',{ agent:new HttpsProxyAgent('http://127.0.0.1:8580')}).then(function(res){
        ...
    })
