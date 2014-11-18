require 'sinatra/base'

class PersonalWebsite < Sinatra::Base
  set :public_folder, 'public'

  get '/' do 
    erb :temporary
  end

end