class Mastermind
  def print_instructions
    print "Welcome to Mastermind! The object of the game is to guess a 4-color code "\
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
  attr_reader :user_input, :valid_guess

  def initialize
    @valid_guess = false
    @user_input = ""
  end

  def input_guess
    until @valid_guess
      print "Make a guess using available colors (R, O, Y, G, B, P): "
      @user_input = clean_guess(gets.chomp)
      validate_length(@user_input)
      validate_colors(@user_input)
    end
    @user_input
  end

  def clean_guess(guess)
    begin
      guess = guess.upcase.gsub(/[\W]/, "")
    rescue NoMethodError, TypeError
      puts "Please enter only letters."
    end
  end

  def validate_length(guess)
    if guess.length != 4
      puts "Please enter only four colors."
    end
  end

  def validate_colors(guess)
    if /[ROYGBP]{4}/.match(guess)
      @valid_guess = true
    else
      puts "Please enter only available colors: R, O, Y, G, B, P."
    end
    guess
  end
end
