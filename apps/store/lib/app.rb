require "sinatra"

class App < Sinatra::Base
  get '/' do
    erb :"comics/index"
  end
end
