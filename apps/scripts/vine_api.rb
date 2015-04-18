require 'httparty'
require 'awesome_print'
require "action_view"

API_KEY = '2b85ac901ee19c8280d35b2d562e6a92c4a8200c'
web_data ||= HTTParty.get("http://www.comicvine.com/api/issues/?api_key=#{API_KEY}")


web_data.tap { |s| ap s["response"] }

# each_with_index do |data, idx|
# 	puts idx
# 	ap ActionView::Base.full_sanitizer.sanitize(data[1]["results"]["issue"][0]["description"])
# end