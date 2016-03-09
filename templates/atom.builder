xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title @site_title
  xml.id @url
  xml.link "rel" => "self", "href" => @url+"atom.xml"
  xml.link "href" => @url
  xml.updated articles.first.date.iso8601 unless articles.empty?
  xml.author { xml.name @author }

  articles[0...10].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.iso8601
      xml.updated article.date.iso8601
      xml.author { xml.name @author }
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end

