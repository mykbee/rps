require 'digest/sha1'

class RPS::Player
  def initialize id = nil, username, password
    # make id part of the player object
    @id = id
    @username = username
    @password_digest = password_digest
  end

  def update_password password
    @password_digest = Digest::SHA1.hexdigest(password)
  end
<<<<<<< HEAD

  def has_password? password
     Digest::SHA1.hexdigest(password) == @password_digest
  end
=======
>>>>>>> 22c49ad657e7f29e0912f195855d98edd66da51c
end
