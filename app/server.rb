require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'
require_relative 'helpers/datamapper_helper'
require_relative 'helpers/application_helper'
require_relative 'models/user'
require_relative 'models/post'

class PersonalWebsite < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret session'
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

  get '/projects' do
    erb :projects
  end

  get '/about' do
    erb :about
  end

  get '/test' do
    erb :test
  end

  get '/blog' do
    @posts = Post.all
    erb :blog
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  get '/posts/new' do
    @post = Post.new
    erb :"posts/new"
  end

  post '/posts/new' do
    @post = Post.create(:content => params[:content],
                        :title => params[:title],
                        :user_id => current_user.id)
    redirect to '/blog'
  end


  post '/users' do
    @user = User.create(
              :username => params[:username],
              :realname => params[:realname],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    username, password = params[:username], params[:password]
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect '/blog'
    else
      flash[:errors] = ["The email or password is incorrect"]
      erb :"sessions/new"
    end
  end

  delete '/sessions' do
    flash[:notice] = "Good bye!"
    session[:user_id] = nil
    redirect to('/')
  end

end