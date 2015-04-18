require "sinatra"

get '/', host_name: 'localhost' do
  "#{request.env.inspect}"
end

get '/say/*/to/*' do
  "Say #{params[:splat][0]} to #{params[:splat][1]}"
end

get '/goodbye' do
  "goodbye world"
end