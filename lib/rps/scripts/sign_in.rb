
module RPS
  class SignInValidate
    def self.run(params)
      player = RPS.db.get_player(params[:user])

      if player.nil?
        return {:success? => false, :error => :player_does_not_exist}
      end

      correct_password = player.check_password?(params)
      
      if correct_password == false
        @wrong_pw_msg = "Incorrect password, try again."
        return {:success? => false, :error => :invalid_password}
      end

      session_id = RPS.db.create_session(:player_id => player.id)

      {
        :success? => true,
        :session_id => session_id 
      }

    end
  end
end






