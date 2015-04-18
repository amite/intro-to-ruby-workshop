require "sinatra"

class App < Sinatra::Base
  get '/' do
    "Modular App"
  end
end