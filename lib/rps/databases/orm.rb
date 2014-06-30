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
            game_id integer REFERENCES games(id),
            p1_id integer REFERENCES players(id),
            p2_id integer REFERENCES players(id),
            p1_move text,
            p2_move text,
            winner integer,
            active text,
            turn integer
            )])
      end

      def create_player username, password
        response = @db.exec_params(%Q[
          INSERT INTO players (username, password) VALUES ($1, $2)
          RETURNING id;
          ], [username, password])
          id = response.first["id"]
          RPS::Player.new(id, username, password)
      end

      def get_player username
        response = @db.exec_params(%Q[
          SELECT * FROM players WHERE username = $1;], [username])
        # binding.pry
        if response.first.nil?
          return nil
        end
        id = response.first["id"]
        username = response.first["username"]
        password = response.first["password"]
        RPS::Player.new(id, username, password)
      end

      # def has_password?(username)
      #   response = @db.exec_params(%Q[
      #     SELECT password FROM players WHERE username = $1
      #     RETURNING password;
      #     ], [username])
      #   if response.first.nil?
      #     return nil
      #   end
      #   password = response.first["password"]
      # end

      # def delete_player username
      #   # DELETE projects WHERE username = #{id};

      # end

      def create_game p1_id
        response = @db.exec_params(%Q[
          INSERT INTO matches (p1_id) VALUES ($2)
          ])
      end

      def get_matches active, turn
        response = @db.exec_params(%Q[
          SELECT * FROM matches WHERE active = $1 AND turn = $2;], [active, turn])
        active = response.first['active']
        player_id = response.first['turn']

        binding.pry
      end
# orm takes info from game_engine and populates the db
# create a matches obj

  end
end





