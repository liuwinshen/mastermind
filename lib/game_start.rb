require_relative './mastermind'
require_relative './code'
require_relative './inputguess'

game = Mastermind.new
game.print_instructions
secret_code = Code.generate
input = InputGuess.new
user_guess = input.input_guess

puts "\tFor the purposes of this PR, I'm going to tell you the secret code:
      #{secret_code.join}.

      The number of times each color appears in the code is #{game.color_count(secret_code)}.
      The number of times each color appears in your guess is #{game.color_count(user_guess.chars)}."
