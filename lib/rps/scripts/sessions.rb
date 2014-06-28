require 'sinatra'
require_relative '../rps.rb'

module RPS
  class Sesh
    
    def self.run
      r_string = (0...8).map { (65 + rand(26)).chr }.join
      {session_id: r_string}
    end
  end
end


# enable :sessions

# get '/login' do
#   hash = RPS::Sesh.run
#   sessions[:sesh_id] = hash[:session_id]
# end

# get '/sesh' do
#   session[:sesh_id]
# end