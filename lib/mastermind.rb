class Mastermind
  def initialize(code, input)
    @game_code = code
    @game_input = input
    @remaining_guesses = 10
    @past_guesses = []
  end

  def print_instructions(long_colors)
    puts "\tWelcome to Mastermind! The object of the game is to guess a 4-color code
        (order matters) within 10 guesses. The available colors are #{long_colors}.
        Colors may be used in the code more than once or not at all.

        To make a guess: type the first letter of each color you're guessing in caps.
        For example, if you want to guess red, orange, yellow, red, enter 'ROYR'.

        After each guess, you will receive feedback in the form of colored pins,
        letting you know:
          \t- how many colors are correct but in the wrong position (white pins)
          \t- how many colors are correct and in the right position (red pins)

        To quit the game, type '/q'. To start a new game, type '/r'."
  end

  def play(short_colors)
    while @remaining_guesses > 0
      puts "You have #{@remaining_guesses} guesses remaining."
      guess = @game_input.input(short_colors)
      @past_guesses << guess
      puts "Your previous guesses were #{@past_guesses}."

      secret_code = @game_code.code
      white_count = @game_code.white_pins(secret_code, guess)
      feedback = @game_code.red_and_white(white_count, secret_code, guess)
      if feedback[:red] == 4
        puts "You win! The code was #{secret_code}. Would you like to play again? "
      end
      @remaining_guesses -= 1
    end
    @remaining_guesses
    if feedback[:red] != 4
      puts "Sorry, the code was #{secret_code}. Would you like to play again? "
    end
  end
end
