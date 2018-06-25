require_relative './mastermind'
require_relative './code'
require_relative './inputguess'

code = Code.new
short_colors = code.short_colors
long_colors = code.long_colors
input = InputGuess.new
game = Mastermind.new(code, input)

game.print_instructions(long_colors)
game.play(short_colors)
