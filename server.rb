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
  user = RPS.db.get_player(session[:player_id])
  erb :game
end

post '/game' do
  params.merge!(player_id: session[:player_id])
  result = RPS::GamePlay.run(params)
  erb :game
end

post '/login' do
  result = RPS::SignInValidate.run(params)

  if result[:success?] == false
    @wrong_pw_msg = "Incorrect password, try again."
  else
    session[:player_id] = result[:player_id]
  end
  redirect to '/game'

  erb :login
end

get '/login' do
  # hash = RPS::Sesh.run
  # sessions[:sesh_id] = hash[:session_id]
  erb :login
end

# get '/sesh' do
#   session[:sesh_id]
# end
