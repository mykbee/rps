
module RPS
  class SignInValidate
    def self.run(params)
      user = RPS.db.get_player(params[:username])

      if user.nil?
        return {:success? => false, :error => :user_does_not_exist}
      else
        puts "kitty"
      end

      response = RPS.db.check_password(params[:password])


      if response
        {:success? => true, :error => nil}
        # run the set session transaction
      end
    end
  end
end

