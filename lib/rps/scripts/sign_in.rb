
module RPS
  class SignInValidate
    def self.run(params)
      player = RPS.db.get_player(params[:user])
      if player.nil?
        return {:success? => false, :error => :player_does_not_exist}
      end

      correct_password = player.check_password?(params)

      if correct_password == false
        return {:success? => false, :error => :invalid_password}
      end


      {
        :success? => true,
        :player_id => player.id
      }

    end
  end
end

