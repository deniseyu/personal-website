require 'sinatra/base'

class PersonalWebsite < Sinatra::Base
  set :public_folder, 'public'

  get '/' do 
    erb :index
  end

  get '/cv' do 
    erb :cv
  end

  get '/error' do 
    erb :error
  end

end