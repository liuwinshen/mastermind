require_relative './messages'
require_relative './game_commands'

module UserInput
  include GameCommands, Messages

  def get_upcase_input
    guess_prompt
    gets.chomp.upcase
  end

  def get_valid_input(validator)
    guess = get_upcase_input
    quit if guess == "QUIT"
    restart if guess == "RESTART"
    errors = validator.validate(guess)
    if errors.empty?
      guess
    else
      puts errors
      get_valid_input(validator)
    end
  end
end
