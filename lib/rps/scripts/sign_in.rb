
module RPS
  class SignInValidate
    def self.run(params)
      player = RPS.db.get_player(params[:user])
      if player.nil?
        return {:success? => false, :error => :player_does_not_exist}
      end
<<<<<<< HEAD
      #where should we return the object
      response = RPS.db.check_password(params[:password])

      if response
        {:success? => true, :error => nil}
        # run the set session transaction
=======

      correct_password = player.check_password?(params)
      
      if correct_password == false
        return {:success? => false, :error => :invalid_password}
>>>>>>> 22c49ad657e7f29e0912f195855d98edd66da51c
      end

      session_id = RPS.db.create_session(:player_id => player.id)

      {
        :success? => true,
        :session_id => session_id 
      }

    end
  end
end






