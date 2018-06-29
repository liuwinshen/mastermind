require_relative './mastermind'
require_relative './code'
require_relative './inputguess'

def play
  code = CodeGenerator.new
  input = InputGuess.new
  game = Mastermind.new(code.secret_code, input)

  game.print_instructions(code.long_colors)
  game.loop_guesses(code.short_colors)
  play if game.restart
end

play
