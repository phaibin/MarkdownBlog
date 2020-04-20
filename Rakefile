require 'stringex'

task :default => :new

desc "Create a new article."
task :new do
  title = ask('Title: ')
  raise "must has a title" if title.empty?

  slug = title.empty? ? nil : title.strip.to_url

  article = {'title' => title, 'date' => Time.now.strftime("%Y-%m-%d %H:%M")}.to_yaml
  article << "---\n"
  article << "Once upon a time...\n\n"

  path = "#{File.dirname(__FILE__)}/articles/#{Time.now.strftime("%Y-%m-%d")}#{'-' + slug if slug}.md"

  unless File.exist? path
    File.open(path, "w") do |file|
      file.write article
    end
    out "an article was created for you at #{path}."
  else
    out "I can't create the article, #{path} already exists."
  end
end

desc "Publish my blog."
task :publish do
  out "publishing your article(s)..."
  `git add .; git commit -am "new post"; git push origin master`
end

def out msg
  puts "\n  MarkdownBlog ~ #{msg}\n\n"
end

def ask message
  print message
  STDIN.gets.chomp
end

