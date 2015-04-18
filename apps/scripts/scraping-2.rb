require 'open-uri'
require 'nokogiri'

web_page = open("http://www.mycomicshop.com/newreleases") 
doc = Nokogiri::HTML(web_page)

# puts doc
def latest_titles(doc)
  titles  = []

  doc.css('div.title a').each do |node|
    titles << node.text
  end
  
  titles
end

p latest_titles(doc)



# https://github.com/sparklemotion/nokogiri/wiki/Cheat-sheet