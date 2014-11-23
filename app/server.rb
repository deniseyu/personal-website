require 'sinatra/base'
require 'sinatra/partial'

class PersonalWebsite < Sinatra::Base
  set :partial_template_engine, :erb
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

  get '/about' do 
    erb :about
  end

  get '/test' do 
    erb :test
  end

end