class Mastermind
  attr_reader :guess_count, :past_guesses

  def initialize
    @guess_count = 0
    @past_guesses = []
  end

  def print_instructions(long_colors)
    puts "\tWelcome to Mastermind! The object of the game is to guess a 4-color code
        (order matters) within 10 guesses. The available colors are #{long_colors}.
        Colors may be used in the code more than once or not at all.

        To make a guess: type the first letter of each color you're guessing in caps.
        For example, if you want to guess 'red, orange, yellow, red,' enter 'ROYR'.

        After each guess, you will receive feedback in the form of colored pins,
        letting you know:
          \t- how many colors are correct but in the wrong position (white pins)
          \t- how many colors are correct and in the right position (red pins)

        To quit the game, type '/q'. To start a new game, type '/r'."
  end

  # def play(short_colors)
  #   while @guess_count <= 10
  #     InputGuess.input(short_colors)
  #
  #     @guess_count += 1
  #   end
  # end
end
