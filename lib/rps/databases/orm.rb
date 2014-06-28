require 'pg'

module RPS
  # module Databases
    class ORM
      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'rps')
        build_tables
      end

      def build_tables
        @db.exec(%q[
            CREATE TABLE IF NOT EXISTS players(
            id serial NOT NULL PRIMARY KEY,
            username varchar(30),
            password varchar(30)
            )])

        @db.exec(%q[
            CREATE TABLE IF NOT EXISTS games(
            id serial NOT NULL PRIMARY KEY,
            p1_wins integer,
            p2_wins integer
            )])

        @db.exec(%q[
            CREATE TABLE IF NOT EXISTS matches(
            id serial NOT NULL PRIMARY KEY,
            p1_id integer REFERENCES players(id),
            p2_id integer REFERENCES players(id)
            )])
      end

      def create_player username, password
        response = @db.exec_params(%Q[
          INSERT INTO players (username, password) VALUES ($1, $2)
          ], [username, password])
          RPS::Player.new(username, password)
      end

      def get_player username
        response = @db.exec_params(%Q[
          SELECT password FROM players WHERE username = $1;], [username])
        response.first['password']
      end
    # end
  end
end

