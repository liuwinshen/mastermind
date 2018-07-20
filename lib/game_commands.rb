require_relative './messages'

module GameCommands
  include Messages

  def replay
    replay_prompt
    restart if gets.chomp.match(/[yY]/)
  end

  def quit
    quit_message
    exit
  end

  def restart
    restart_message
    system 'clear'
    load '/users/win/Documents/GitHub/mastermind/lib/play_game.rb'
  end
end