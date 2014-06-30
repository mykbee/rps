class RPS::Matches
  attr_accessor :id, :game_id, :p1_id, :p2_id, :p1_move, :p2_move, :winner, :active

  def initialize id, game_id, p1_id, p2_id, p1_move, p2_move, winner, active
    @id = id
    @game_id = game_id
    @p1_id = p1_id
    @p2_id = p2_id
    @p1_move = p1_move
    @p2_move = p2_move
    @winner = winner
    @active = active
  end

end
