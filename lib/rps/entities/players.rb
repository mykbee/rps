class RPS::Player
  def initialize id = nil, username, password
    # make id part of the player object
    @id = id
    @username = username
    @password = password
  end
end
