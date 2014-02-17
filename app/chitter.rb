require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relative './db_config'


class Chitter < Sinatra::Base
# set :views, File.join(File.dirname(__FILE__), '../views')
set :public_folder, File.join(File.dirname(__FILE__),'..', 'public')
Dir.glob(File.join(File.dirname(__FILE__), 'models', '*.rb'), &method(:require))
enable :sessions
set :session_secret, 'carpe diem'
use Rack::Flash

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
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user = User.new(:name => params[:name],
                :username => params[:username],
                :email => params[:email], 
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
          redirect to('/')
        else
          flash[:errors] = ["The username or password are incorrect. Please try again."]
          erb :"sessions/new"
        end
   end

helpers do

  def current_user    
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
