require "sinatra"

get '/hello/:name' do |name|
  "Hello #{name}"
end

get '/goodbye' do
  "goodbye world"
end