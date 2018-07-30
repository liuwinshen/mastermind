require_relative './messages'
require_relative './commands'

class UserInput
  def self.get_upcase_input
    Messages.guess_prompt
    gets.chomp.upcase
  end
end
