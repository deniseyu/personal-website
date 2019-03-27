require 'sinatra/base'
require 'sinatra/assetpack'

class PersonalWebsite < Sinatra::Base
  register Sinatra::AssetPack

  get '/' do
    erb :index
  end

  get '/talks' do
    erb :talks
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

  get '/techtalks' do
    erb :techtalks
  end

  get '/letssketchtech' do
    erb :letssketchtech
  end

  get '/srecon' do
    erb :srecon
  end

  get '/srecon-slides' do
    send_file(File.join(settings.public_folder, 'dist-sys-deck.pdf'))
  end
end
