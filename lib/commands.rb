require_relative './messages'
#require 'json'

class Commands
  def self.quit
    Messages.quit_message
    exit
  end

  def self.restart(game)
    game.restart = true
    system 'clear'
    Messages.restart_message
  end

  # def save_game
  #   tempHash = {
  #       "key_a" => "val_a",
  #       "key_b" => "val_b"
  #   }
  #   File.open("public/temp.json","w") do |f|
  #     f.write(tempHash.to_json)
  # end
end
