class RPS::GameEngine
  # RULES = {
  #   "rock"     => {"rock" => "draw", "paper" => "paper", "scissors" => "rock"},
  #   "paper"    => {"rock" => "paper", "paper" => "draw", "scissors" => "scissors"},
  #   "scissors" => {"rock" => "rock", "paper" => "scissors", "scissors" => "draw"}
  # }

  # # can't actually play until the db has both moves
  # def play(p1, p2)
  #   @winner = RULES[p1][p2]
  # end
  # # hand the resulting moves and player ids to orm

  def play(move1, move2)
    moves = ["rock", "paper", "scissors"]
    # user can't enter something unexpected
    if moves.include?(move1) == false || moves.include?(move2) == false
      return false
    end

    case 
    when move1 == move2
      puts "It's a tie!"
    when move1 == "rock" && move2 != "paper"
      puts "player1 wins this round!"
      @win_count1 += 1
    when move1 == "paper" && move2 != "scissors"
      puts "player1 wins this round!"
      @win_count1 += 1
    when move1 == "scissors" && move2 != "rock"
      puts "player1 wins this round!"
      @win_count1 += 1
    else
      puts "player2 wins this round!"
      @win_count2 += 1
    end
  end
end

