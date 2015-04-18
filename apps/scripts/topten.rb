require 'open-uri'
require 'nokogiri'

web_page = open("http://comicbooks.about.com/od/characters/tp/topsuperhero.htm") 
doc = Nokogiri::HTML(web_page)



doc.css('div.expert-content-text > h3').each do |node|
	p node.text.strip.gsub(/\d+\./m, "").gsub(/\s+/, "").strip
end



# https://github.com/sparklemotion/nokogiri/wiki/Cheat-sheet