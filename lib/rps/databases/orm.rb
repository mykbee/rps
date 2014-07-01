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
            active boolean
            )])
      end

      def create_player username, password
        response = @db.exec_params(%Q[
          INSERT INTO players (username, password) VALUES ($1, $2)
          RETURNING id;
          ], [username, password])
          id = response.first["id"]
          RPS::Player.new(username, password, id)
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
        RPS::Player.new(username, password, id)
      end

      # def delete_player username
      #   # DELETE projects WHERE username = #{id};

      # end

      def create_game p1_id
        response = @db.exec_params(%Q[
          INSERT INTO matches (p1_id) VALUES ($2)
          ]) # b gets inserted
      end

      def update_matches player_id, player_move

        # response = @db.exec(%Q[
        #   UPDATE matches WHERE NULL
        #   ])
      end


      def get_matches move
        response = @db.exec(%Q[
          SELECT * FROM matches WHERE (p1_id = '#{player_id}') AND active = TRUE;])
        id = response.first['id']
        game_id = response.first['game_id']
        p1_id = response.first['p1_id']
        p2_id = response.first['p2_id']
        p1_move = response.first['p1_move']
        p2_move = response.first['p2_move']
        winner = response.first['winner']
        active = response.first['active']
        RPS::Matches.new(id, game_id, p1_id, p2_id, p1_move, p2_move, winner, active)
      end
# orm takes info from game_engine and populates the db
# create a matches obj

      def record_winner player_id, mid
        puts player_id
        @db.exec("UPDATE matches SET winner = '#{player_id}' WHERE id = #{mid};")
      end

  end
end





