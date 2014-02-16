require 'sinatra/base'
require 'data_mapper'
require_relative './db_config'


class Chitter < Sinatra::Base
# set :views, File.join(File.dirname(__FILE__), '../views')
set :public_folder, File.join(File.dirname(__FILE__),'..', 'public')
Dir.glob(File.join(File.dirname(__FILE__), 'models', '*.rb'), &method(:require))
enable :sessions
set :session_secret, 'carpe diem'

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    peep = params["peep"]
    Post.create(:body =>peep)
    redirect to('/')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(:name => params[:name],
                :username => [:username],
                :email => params[:email], 
                :password => params[:password], 
                :password_confirmation =>[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/')
end

helpers do

  def current_user    
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
