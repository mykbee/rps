require 'digest/sha1'

class RPS::Player
  def initialize username, password, id=nil
    # make id part of the player object
    @id = id
    @username = username
    @password_digest = password_digest
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

#   def update_password password
#     @password_digest = Digest::SHA1.hexdigest(password)
#   end


#   def has_password? password
#      Digest::SHA1.hexdigest(password) == @password_digest
#   end

# end
