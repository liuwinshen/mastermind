class Mastermind
  attr_reader :red_count, :white_count

  def print_instructions
    puts "\tWelcome to Mastermind! The object of the game is to guess a 4-color code
        within 10 guesses. The available colors are red, orange, yellow, green,
        blue, and purple. Colors may be used in the code more than once or not at all.

        To make a guess: type the first letter of each color you're guessing in caps.
        For example, if you want to guess 'red, orange, yellow, red,' type 'ROYR'.

        After each guess, you will receive feedback in the form of colored pins,
        letting you know:
          \t- how many colors are correct but in the wrong position (white pins)
          \t- how many colors are correct and in the right position (red pins)

        To quit the game, type '/q'. To start a new game, type '/r'."
  end

  def color_count(code)
    color_count = Hash.new(0)
    code.each do |color|
      color_key = color.to_sym
      color_count[color_key] += 1
      end
    color_count
  end

  def get_color_counts(code, guess)
    code_count = color_count(code)
    guess = guess.chars
    guess_count = color_count(guess)
  end

  # def compare_red_pins(code_color_count, guess_color_count)
  #   @red_count = 0
  #   guess_count.each do |key, value|
  #   end
  # end
end
