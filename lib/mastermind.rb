require_relative './user_input'
require_relative './guess_validator'
require_relative './guess_checker'
require_relative './messages'
require_relative './commands'

class Mastermind
  include Commands, Messages, UserInput

  attr_accessor :restart

  def initialize(code)
    @code = code
    @validator = GuessValidator.new
    @guess_checker = GuessChecker.new(code)
    @remaining_guesses = 10
    @past_guesses = []
    @restart = false
  end

  def play_game(long_colors)
    print_instructions(long_colors)
    feedback = []

    while @remaining_guesses > 0
      start_turn_message(@remaining_guesses)
      guess = get_upcase_input
      valid_guess = check_input(guess)
      break if valid_guess == false

      feedback = score(valid_guess)
      score_message(feedback)
      break if win?(feedback)

      log_guess(valid_guess)
      @remaining_guesses -= 1
    end
    outcome(feedback) unless @restart
  end

  def check_input(guess)
    if command?(guess)
      run_command(guess)
      return false
    end

    errors = @validator.validate(guess)
    if errors.empty?
      return guess
    else
      puts errors
      guess = get_upcase_input
      check_input(guess)
    end
  end

  def command?(input)
    ["QUIT", "RESTART"].include?(input)
  end

  def run_command(input)
    quit_game if input == "QUIT"
    restart_game if input == "RESTART"
  end

  def outcome(feedback)
    if win?(feedback)
      win_message(@code)
    else
      loss_message(@code)
    end
    replay_prompt
    restart_game if gets.chomp.match(/[yY]/)
  end

  def score(guess)
    @guess_checker.get_feedback(guess)
  end

  def log_guess(guess)
    @past_guesses << guess
    past_guess_message(@past_guesses)
  end

  def win?(feedback)
    feedback[:red] == 4
  end
end
