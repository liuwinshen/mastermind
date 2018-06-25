require_relative './mastermind'
require_relative './code'
require_relative './inputguess'

game = Mastermind.new
code = Code.new
short_colors = code.short_colors
long_colors = code.long_colors
input = InputGuess.new

game.print_instructions(long_colors)
user_guess = input.input_guess(short_colors)

puts "\tFor the purposes of this PR, I'm going to tell you the secret code:
        #{code.code}.

      The number of times each color appears in the code is
        #{code.color_count(code.code)}.
      The number of times each color appears in your guess is
        #{code.color_count(user_guess.chars)}."
