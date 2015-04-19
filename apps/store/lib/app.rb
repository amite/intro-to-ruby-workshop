require "models/comic"

class App < Sinatra::Base
  get '/' do
    erb :"comics/index"
  end

  get '/comics/new' do
    erb :"comics/new"
  end

  post '/comics' do
    @comic = Comic.new params[:comic]
    if @comic.save
      redirect "/"
    else
      erb :"comics/new"
    end
  end
end
