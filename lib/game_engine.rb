class RPS::GameEngine
  RULES = {
    "rock"     => {"rock" => "draw", "paper" => "paper", "scissors" => "rock"},
    "paper"    => {"rock" => "paper", "paper" => "draw", "scissors" => "scissors"},
    "scissors" => {"rock" => "rock", "paper" => "scissors", "scissors" => "draw"}
  }

# can't actually play until the db has both moves

  def play(p1, p2)
    @winner = RULES[p1][p2]
  end

  # hand the resulting moves and player ids to orm

end



