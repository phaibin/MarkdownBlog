require 'tilt'
require 'yaml'
require 'time'

class Article

  attr_accessor :file_path
  attr_accessor :left
  attr_accessor :right
  attr_accessor :date
  attr_accessor :search_title
  attr_accessor :search_summary

  class << self
    def load(dir, ext="md")
      p "load"
      @articles ||= {}
      Dir.glob("#{dir}/**/*.#{ext}").each do |file|
        article = Article.new(file)
        @articles[article.slug] = article
      end

      all_articles = @articles.values.sort
      all_articles.each_with_index do |a, index|
        a.left = all_articles[index-1] if index>0
        a.right = all_articles[index+1] if index<all_articles.count-1
      end
    end

    def [](slug)
      @articles[slug]
    end

    def articles
      @articles.values.sort.reverse
    end

    def find_by_tag(tag)
      articles.select { |article| article.tags and article.tags.include? tag }
    end

    def search(keywords)
      articles.select { |article| article.match keywords }
    end
  end

  def initialize(file_path)
    @file_path = file_path

    yaml = File.read(file_path).split(/---/, 3)[1]
    @offset = yaml.length

    @options = YAML.load(yaml)
    @date = Time.parse(@options['date'].gsub('/', '-')) rescue Time.now
  end

  %w(title author tags).each do |m|
    class_eval "def #{m};@options['#{m}'];end"
  end

  def slug
    File.basename(@file_path, ".*")
  end

  def <=>(article)
    self.date <=> article.date
  end

  def body
    Tilt::RDiscountTemplate.new{ content }.render.force_encoding('utf-8')
  end

  def summary
    Tilt::RDiscountTemplate.new{ content[0..160] }.render.force_encoding('utf-8')
  end

  def path
    '/' + slug.split("-",4).join("/")
  end

  def url
    path
  end

  def show_date
    self.date.strftime("%Y-%m-%d")
  end

  def match keywords
    has_find = false
    self.search_title = self.title
    self.search_summary = self.summary
    keywords.split.each do |keyword|
      if self.title.downcase.include? keyword.downcase
        has_find = true
        self.search_title = self.search_title.gsub keyword, "<span class='search'>#{keyword}</span>"
      end
      if content.downcase.include? keyword.downcase
        has_find = true

      end
    end
    has_find
  end

  private
  def content
    return @content if instance_variable_defined?("@content")
    # File.new(@file_path).lines.drop(@offset).join
    File.read(file_path).split(/---/, 3)[2]
  end
end
