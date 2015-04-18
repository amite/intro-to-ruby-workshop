require "sinatra"

get '/hello/:name' do
  "Hello #{params[:name]}"
end

get '/goodbye' do
  "goodbye world"
end