module RPS
  def self.db
    @__db_instance ||= Databases::ORM.new
  end
end

require_relative './rps/databases/orm.rb'
require_relative './rps/entities/games.rb'
require_relative './rps/entities/matches.rb'
require_relative './rps/entities/players.rb'
require_relative '../spec/spec_helper.rb'
require_relative 'server'
