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

  erb :game
end

post '/game' do
  @result = RPS::GamePlay.run(params)
  erb :game
end

post '/login' do
  result = RPS::SignInValidate.run(params)

  if result[:success?] == false
    @wrong_pw_msg = "Incorrect password, try again."
  end

  erb :login
end

get '/login' do
  # hash = RPS::Sesh.run
  sessions[:sesh_id] = hash[:session_id]
  erb :login
end

# get '/sesh' do
#   session[:sesh_id]
# end
