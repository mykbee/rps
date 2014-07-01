class RPS::Player
  def initialize username, password, id=nil
    # make id part of the player object
    @id = id
    @username = username
    @password = password
  end

  def check_password?(params)
    hash = { :user => params[:user], :pass => params[:pass] }
    user = hash[:user] 
    pass = hash[:pass]
    db_pw = RPS.db.get_player(user)
    if pass != @password
      return false
    else
      return true
    end
  end

end