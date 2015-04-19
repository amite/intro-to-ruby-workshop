require 'open-uri'
require 'nokogiri'

web_page = open("http://www.google.com/search?q=dilbert")
doc = Nokogiri::HTML(web_page)

# puts doc

doc.css('h3 a').each do |node|
  puts node.text
end
