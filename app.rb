require 'sinatra/base'
require 'sinatra/assetpack'
require 'sass'

class PersonalWebsite < Sinatra::Base
  register Sinatra::AssetPack

  get '/' do
    erb :index
  end

  get '/art' do
    erb :gallery
  end

  get '/distsystalk' do
    erb :distsystalk
  end

  get '/sketchnoting' do
    send_file(File.join(settings.public_folder, 'sketchnoting-talk.pdf'))
  end

  get '/odb' do
    erb :odbtalk
  end
end
