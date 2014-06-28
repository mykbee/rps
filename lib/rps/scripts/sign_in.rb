module RPS
  class SignInValidate
    def self.run(params)
      user = RPS::ORM.get_player(params[:username])

      if user.nil?
        {:success? => false, :error => :user_does_not_exist}
      end

      response = RPS::ORM.db.check_password(params[:password])


      if response
        {:success? => true, :error => nil}
        # run the set session transaction
      end

    end
  end
end
