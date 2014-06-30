module RPS
  class GamePlay

# check for active matches ... consult active_turns table
# if turn not active return success = false/waiting msg
# if success=true, get user input and hand it to game engine
  check_for_active = RPS.db.get_matches('true', 74)
    if check_for_active
      return {:success? => true, :error => nil}
    #call new method
    end
RPS::ORM.game_engine()
#write method to get move



  end
end
