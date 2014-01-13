我的主页blog系统。基于Toto的模板dorothy，我把它用sinatra改写了一下，方面扩展功能。

使用时，输入rake new，回车，然后输入文章名称，就会生成文章的模板。然后可以继续编辑。

可以很方便地部署到heroku。

另外还建立了另外一个task：rake publish，会默认提交代码，并push到github和heroku。