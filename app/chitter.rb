require "data_mapper"
env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'peeps' 
require_relative 'user' 


DataMapper.finalize
DataMapper.auto_upgrade!

require 'sinatra/base'

class Chitter < Sinatra::Base

set :views, Proc.new { File.join(root, "..", "views") }


  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/' do 
    peep = params[:peep]
    Peeps.create(:peep => peep)
    redirect to '/'
  end


get '/users/new' do

  erb :"users/new"
end

  post "/users/new" do 
    email = params[:email]
    User.create(:email => email)
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
