require 'sinatra'
require 'rubygems'
require 'pry-byebug'
# require_relative 'game_engine'

set :bind, '0.0.0.0' # This is needed for Vagrant

get '/game' do
  # "Hey, this is a web app"
  erb :game
end

get '/login' do

 erb :login
end
