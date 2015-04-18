require "sinatra"

get '/say/*/to/*' do
  "Say #{params[:splat][0]} to #{params[:splat][1]}"
end

get '/goodbye' do
  "goodbye world"
end