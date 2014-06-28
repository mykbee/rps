require 'sinatra'
require 'rubygems'
require 'pry-byebug'
# require_relative 'game_engine'
require_relative './rps.rb'

set :bind, '0.0.0.0' # This is needed for Vagrant

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
   @result = RPS::SignInValidate.run(params)

  # @name = params[:user]
  # @pword = params[:pass]
  # binding.pry
  erb :login
end
