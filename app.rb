require 'sinatra/base'
require 'sinatra/assetpack'
require 'sass'

class PersonalWebsite < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    css :application, [
      '/css/*.css'
    ]

    css_compression :sass
  end

  get '/' do
    erb :index
  end
end
