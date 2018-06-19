class Mastermind
  def print_instructions
    puts "Welcome to Mastermind! The object of the game is to guess a 4-color code "\
        "within 10 guesses. The available colors are red, orange, yellow, green, "\
        "blue, and purple. Colors may be used in the code more than once or not at all."\

        "\nTo make a guess: type the first letter of each color you're guessing in caps. "\
        "For example, if you want to guess 'red, orange, yellow, red,' type 'ROYR'."\

        "\nAfter each guess, you will receive feedback in the form of colored pins, letting you know:"\
          "\n\t- how many colors are correct but in the wrong position (white pins)"\
          "\n\t- how many colors are correct and in the right position (red pins)"\

        "\nTo quit the game, type '/q'. To start a new game, type '/r'."
    end

  def compare(code, guess)
  end
end

class Code
  attr_reader :code

  def generate_code
    @code = []
    colors = ["R", "O", "Y", "G", "B", "P"]
    while code.length < 4 do
      random_index = Random.rand(0..5)
      @code << colors[random_index]
    end
    return @code
  end
end

class Input
  attr_reader :user_input

  def input_guess
    print "Input a guess (available colors: R, O, Y, G, B, P): "
    @user_input = gets
  end

  def validate_guess(guess = @user_input)
    invalid_guess = true
    while invalid_guess
      begin
        guess = guess.upcase.gsub(/[,/s]/, "")
      rescue NoMethodError
        puts "Please enter only available colors: R, O, Y, G, B, P."
        input_guess
      end

      if guess == /[ROYGBP][ROYGBP][ROYGBP][ROYGBP]/
        invalid_guess = false
      else
        puts "Please enter only available colors: R, O, Y, G, B, P."
        input_guess
      end
    end
    return guess
  end

end
