require 'sinatra'
require 'rubygems'
require 'pry-byebug'
# require_relative 'game_engine'
require_relative './rps.rb'

set :bind, '0.0.0.0' # This is needed for Vagrant

get '/game' do
  # "Hey, this is a web app"
  erb :game
end

get '/login' do
  @user = params[:user]
  @pass = params[:pass]
  @username = params[:reguser]
  @password = params[:regpass]
  @password2 = params[:regpass2]
  RPS::Databases::ORM.create_player(@username, @password)
 erb :login
end
