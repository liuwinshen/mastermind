require_relative './messages'
require_relative './commands'

module UserInput
  include Commands, Messages

  def get_upcase_input
    guess_prompt
    gets.chomp.upcase
  end
end
