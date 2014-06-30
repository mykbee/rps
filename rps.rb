module RPS
  def self.db
    @__db_instance ||= RPS::ORM.new
  end
end

require_relative './lib/rps/databases/orm.rb'
require_relative './lib/rps/entities/games.rb'
require_relative './lib/game_engine.rb'
require_relative './lib/rps/entities/matches.rb'
require_relative './lib/rps/entities/players.rb'
require_relative './lib/rps/scripts/sign_in.rb'
require_relative './lib/rps/scripts/game_play.rb'
# require_relative '../spec/spec_helper.rb'
require_relative 'server'
