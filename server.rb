require 'sinatra'
require 'rubygems'
require 'pry-byebug'
# require_relative 'game_engine'
require_relative './rps.rb'

set :bind, '0.0.0.0' # This is needed for Vagrant
enable :sessions

get '/' do
  "w"
end

get '/game' do
  # "Hey, this is a web app"
  erb :game
end

get '/login' do
  erb :login
end

post '/login' do
  # binding.pry
  result = RPS::SignInValidate.run(params)

  # @name = params[:user]
  # @pword = params[:pass]
  # binding.pry
  erb :login
end

get '/login' do
  # hash = RPS::Sesh.run
  sessions[:sesh_id] = hash[:session_id]
end

# get '/sesh' do
#   session[:sesh_id]
# end
