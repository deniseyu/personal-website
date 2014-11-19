require 'sinatra/base'

class PersonalWebsite < Sinatra::Base
  set :public_folder, 'public'

  get '/' do 
    erb :index
  end

  get '/test' do 
    erb :test
  end

end