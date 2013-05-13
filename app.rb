require 'builder'
require 'sinatra/base'
require 'sinatra/reloader'
require './article'

class MyApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure do
    Article.load(File.dirname(__FILE__)+"/articles")
  end

  helpers do
    def archives
      Article.articles
    end

    def articles
      Article.articles
    end
  end

  set :public_dir, 'public'
  set :views, File.dirname(__FILE__)+'/templates'
  set :site_title => "海神"
  set :url => "http://phaibin.herokuapp.com"
  set :author => "文祥"

  get '/' do
    erb :"pages/index", :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
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
      article: article
    }
  end

  get "/archives" do
    erb :"pages/archives", :locals => { :title => settings.site_title, :site_title => settings.site_title }
  end

  get "/about" do
    erb :"pages/about", :locals => { 
      :site_title => settings.site_title,
      :title => settings.site_title
    }
  end
end