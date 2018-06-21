require_relative './mastermind'
require_relative './code'
require_relative './inputguess'

game = Mastermind.new
game.print_instructions
available_colors = Code.new.colors
secret_code = Code.generate(available_colors)
input = InputGuess.new
user_guess = input.input_guess(available_colors)

puts "\tFor the purposes of this PR, I'm going to tell you the secret code:
      #{secret_code.join}.

      The number of times each color appears in the code is #{game.color_count(secret_code)}.
      The number of times each color appears in your guess is #{game.color_count(user_guess.chars)}."
