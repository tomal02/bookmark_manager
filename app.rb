require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = [
      "www.lukesdentist.com",
      "www.bobsdentist.com",
      "www.google.com"
    ]

    erb :'bookmarks/index'
  end

  run! if app_file == $0
end 