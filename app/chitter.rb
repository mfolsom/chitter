require 'sinatra/base'
require 'data_mapper'
require_relative './db_config'
Dir.glob(File.join(File.dirname(__FILE__), 'models', '*.rb'), &method(:require))

class Chitter < Sinatra::Base
# set :views, File.join(File.dirname(__FILE__), '../views')
  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    peep = params["peep"]
    Post.create(:body =>peep)
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
