# encoding: utf-8

require 'builder'
require 'sinatra/base'
require './lib/article'

class MyApp < Sinatra::Base
  configure do
    Article.load(File.dirname(__FILE__)+"/articles")
  end

  helpers do
    def archives
      Article.archives
    end

    def articles
      Article.articles
    end
  end

  configure do 
    set :public_dir, 'public'
    set :views, File.dirname(__FILE__)+'/templates'
    set :site_title => "海神"
    set :url => "http://phaibin.herokuapp.com"
    set :author => "文祥"
    set :disqus => "phaibin"
  end

  get '/' do
    erb :"pages/index", :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
    }
  end

  get '/tags/:tag' do |tag|
    erb :"pages/tag", :locals => {
      :title => settings.site_title, 
      :site_title => settings.site_title,
      tag: tag,
      articles: Article.find_by_tag(tag)
    }
  end

  get "/atom.xml" do
    @site_title = settings.site_title
    @author = settings.author
    @url = settings.url
    builder :atom
  end

  get '/:year/:month/:day/:slug' do |year, month, day, slug|
    @config = {}
    article = Article["#{year}-#{month}-#{day}-#{slug}"]
    pass unless article
    erb :"pages/article", :locals => {
      :site_title => settings.site_title,
      :title => article.title,
      article: article,
      disqus: settings.disqus
    }
  end

  get "/archives" do
    erb :"pages/archives", :locals => { 
      :title => settings.site_title, 
      :site_title => settings.site_title 
    }
  end

  get "/search" do
    p params[:keyword]
    erb :"pages/search", :locals => {
      :title => settings.site_title, 
      :site_title => settings.site_title,
      articles: Article.search(params[:keyword])
    }
  end

  get "/about" do
    markdown :"pages/about", :layout_engine => :erb, :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
    }
  end

  get "/my-favorite-tools" do
    markdown :'pages/my-favorite-tools', :layout_engine => :erb, :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
    }
  end

  get "/snapshot" do
    markdown :'pages/snapshot', :layout_engine => :erb, :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
    }
  end

  get "/works" do
    markdown :'pages/works', :layout_engine => :erb, :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
    }
  end

  get "/dandelion" do
    markdown :"pages/dandelion", :layout_engine => :erb, :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
    }
  end

  get "/moliview" do
    markdown :"pages/moliview", :layout_engine => :erb, :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
    }
  end

  get "/moliview/help" do
    markdown :"pages/moliview/help", :layout_engine => :erb, :layout => :'layout-page', :locals => { 
      :site_title => settings.site_title,
      :title => "Help"
    }
  end

  get "/moliview/whatsnew" do
    markdown :"pages/moliview/whatsnew", :layout_engine => :erb, :layout => :'layout-page', :locals => { 
      :site_title => settings.site_title,
      :title => "What's New"
    }
  end

  get "/privacy-policy" do
    markdown :"pages/privacy-policy", :layout_engine => :erb, :locals => { 
      :site_title => settings.site_title,
      :title => "Privacy Policy"
    }
  end

  not_found do
    erb :"pages/404", :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
    }
  end
end