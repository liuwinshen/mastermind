require_relative './messages'

class UserInput
  def self.get_upcase_input
    Messages.guess_prompt
    gets.chomp.upcase
  end
end
