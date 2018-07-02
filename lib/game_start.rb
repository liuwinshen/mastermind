require_relative './mastermind'
require_relative './code'
require_relative './input_guess'
require_relative './guess_checker'

def play
  code = CodeGenerator.new
  secret_code = code.secret_code
  input = InputGuess.new
  guess_checker = GuessChecker.new(secret_code)
  game = Mastermind.new(secret_code, input, guess_checker)

  game.print_instructions(code.long_colors)
  game.loop_guesses(code.short_colors)
  play if input.taking_guesses == false
end

play
