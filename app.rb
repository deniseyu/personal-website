require 'sinatra/base'
require 'sinatra/assetpack'
require 'sass'

class PersonalWebsite < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    js :application, [
      '/js/jquery.js',
      '/js/app.js'
    ]

    css :application, [
      '/css/*.css'
    ]

    css_compression :sass
  end

  get '/' do
    erb :index
  end

  get '/vim' do
    erb :vim
  end

  get '/cv' do
    erb :cv
  end

  get '/error' do
    erb :error
  end

  get '/projects' do
    erb :projects
  end

  get '/about' do
    erb :about
  end

end
