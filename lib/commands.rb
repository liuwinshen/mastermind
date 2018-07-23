require_relative './messages'

module Commands
  include Messages

  def quit_game
    quit_message
    exit
  end

  def restart_game
    self.restart = true
    system 'clear'
    restart_message
  end
end
