require_relative './mastermind'
require_relative './code'
require_relative './guess_checker'

def play_game
  code = CodeGenerator.new
  secret_code = code.secret_code
  guess_checker = GuessChecker.new(secret_code)
  game = Mastermind.new(secret_code)

  game.play_game(code.long_colors)
  play_game if game.restart
end

if __FILE__ == $0
  play_game
end
