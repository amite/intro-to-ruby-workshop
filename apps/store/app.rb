require "sinatra"

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  erb :index
end

get '/say/*/to/*' do
  "Say #{params[:splat][0]} to #{params[:splat][1]}"
end

get '/goodbye' do
  "goodbye world"
end