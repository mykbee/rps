module RPS
  class GamePlay

  # check for active matches ... consult active_turns table
  # if turn not active return success = false/waiting msg
  # if success=true, get user input and hand it to game engine
  # argument will be params hash

  def self.run(params)

    # valid_match = RPS.db.get_matches(params[:move])

    # grab player_id
    player_id = params[:player_id]
    # grab player_move
    player_move = params[:move]

    #get_matches by player_id//if p1_id is blank insert move and return match_id
    # match = RPS.db.get_matches(player_id)


    # insert player_move in db
    match =  RPS.db.get_matches(player_id)
    match_id = match.id

    # if valid_match.p2_move.nil?
    #   @waiting_msg = "Waiting on Player 2!"
    #   return {:success? => false, :error => :waiting_on_p2}
    # end
    # if !valid_match.p1_move.nil? && !valid_match.p2_move.nil? && winner.nil?
    #   puts "a"

    #   self.play(p1_move, p2move)
    # else
    #   return {:success? => false, :error => :waiting}
    # end
  end

    def self.play(p1_move, p2_move)
      moves = ["rock", "paper", "scissors"]
      # user can't enter something unexpected
      if moves.include?(p1_move) == false || moves.include?(p2_move) == false
        return false
      end

      case
      when p1_move == p2_move
        puts "It's a tie!"
        # return tie/draw
      when p1_move == "rock" && p2_move != "paper"

        # return p1
        # can we enter the result into the db here? YES

        RPS.db.record_winner(74)
        # also, have we actually entered the players moves yet?
      when p1_move == "paper" && p2_move != "scissors"
        puts "player1 wins this round!"
      when p1_move == "scissors" && p2_move != "rock"
        puts "player1 wins this round!"
      else
        puts "player2 wins this round!"
      end
    end
  end
end
