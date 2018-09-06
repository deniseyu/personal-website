require 'sinatra/base'
require 'sinatra/assetpack'
require 'sass'

class PersonalWebsite < Sinatra::Base
  register Sinatra::AssetPack

  get '/' do
    erb :index
  end
end
