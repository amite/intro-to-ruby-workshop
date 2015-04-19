puts `ruby -v`

require 'httparty'
require 'nokogiri'


CPARSER_API_KEY = "FTPi5xV5q3r3fDEtO7sT"

uri = "http://www.slate.com/blogs/browbeat/2015/04/16/is_tony_dead_david_chase_lends_new_credence_to_sopranos_theory_in_directors.html"
target = "https://api.cparser.com/extract?url=#{uri}&api_key=#{CPARSER_API_KEY}"

web_page =  HTTParty.get(target)

puts web_page['title']
# puts web_page['content']
# puts web_page.keys

File.open('data/web.html', 'w') do |file|
  file.write(web_page['content'])
end