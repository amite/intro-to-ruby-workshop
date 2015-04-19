require "sinatra"

class App < Sinatra::Base
  get '/' do
    erb :"comics/index"
  end

  get '/comics/new' do
    erb :"comics/new"
  end

  post '/posts' do
    puts params
  end
end
