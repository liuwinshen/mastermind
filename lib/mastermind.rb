require_relative './user_input'
require_relative './guess_validator'
require_relative './guess_checker'
require_relative './messages'
require_relative './game_commands'

class Mastermind
  include GameCommands, Messages, UserInput

  def initialize(code)
    @code = code
    @validator = GuessValidator.new
    @guess_checker = GuessChecker.new(code)
    @remaining_guesses = 10
    @past_guesses = []
  end

  def play_game(long_colors)
    print_instructions(long_colors)
    feedback = []

    while @remaining_guesses > 0
      start_turn_message(@remaining_guesses)
      guess = get_valid_input

      feedback = results(guess)
      pins_message(feedback)
      if win?(feedback)
        win_message(@code)
        break
      end
      log_guess(guess)
      @remaining_guesses -= 1
    end
    loss_message(@code) if !win?(feedback)
    replay
  end

  def get_valid_input
    errors = ['Starting validation']
    until errors.empty?
      guess = get_upcase_input
      command?(guess)
      errors = @validator.validate(guess)
      puts errors if !errors.empty?
    end
    guess
  end

  def results(guess)
    @guess_checker.get_feedback(guess)
  end

  def log_guess(guess)
    @past_guesses << guess
    past_guess_message(@past_guesses)
  end

  def command?(value)
    quit if quit?(value)
    restart if restart?(value)
  end

  def win?(feedback)
    feedback[:red] == 4
  end
end
