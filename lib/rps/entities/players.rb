class RPS::Player
  def initialize username, password, id=nil
    # make id part of the player object
    @id = id
    @username = username
    @password = password
  end

  def has_password?(username)
    result = RPS.db.get_player(username)
    if result.first['password'] != params['pass']
      return "Incorrect password, try again."
    else
      true
    end
  end



end