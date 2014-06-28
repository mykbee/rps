
class RPS::SignInValidate
  def self.run(params)
    RPS.db.get_player(params[:username].to_s)

    # if @user.nil?
    #  not_success = {:success? => false, :error => :user_does_not_exist}
    #  puts not_success

    # else
    #  puts "kitty"
  end
    # response = RPS.db.check_password(params[:password])


    # if response
    #   {:success? => true, :error => nil}
    #   # run the set session transaction
    # end


end

