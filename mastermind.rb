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
          \t- how many colors are correct but in the wrong position (red pins)
          \t- how many colors are correct and in the right position (white pins)

        To quit the game, type '/q'. To start a new game, type '/r'."
  end

  def color_count(code)
    @color_count = Hash.new(0)
    code.each do |color|
      color_key = color.to_sym
      if @color_count.key?(color_key)
        @color_count[color_key] += 1
      else
        @color_count[color_key] = 1
      end
    end
    @color_count
  end

  def get_color_counts(code, guess)
    code_count = color_count(code)
    guess = guess.chars
    guess_count = color_count(guess)
  end

  def compare_red_pins(code_color_count, guess_color_count)
    @red_count = 0
    guess_count.each do |key, value|
    end
  end
end

class SecretCode
  attr_reader :code, :color_count

  def generate_code
    @code = []
    colors = ["R", "O", "Y", "G", "B", "P"]
    while code.length < 4 do
      random_index = Random.rand(0..5)
      @code << colors[random_index]
    end
    @code
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
      if validate_length(@user_input)
        validate_colors(@user_input)
      end
    end
    @user_input
  end

  def clean_guess(guess)
    begin
      guess = guess.upcase.gsub(/[\W]/, "")
    rescue NoMethodError, TypeError
      puts "Please enter only letters."
    end
    guess
  end

  def validate_length(guess)
    if guess.length != 4
      valid_length = false
      puts "Please enter four colors using only their first letters."
    else
      valid_length = true
    end
  end

  def validate_colors(guess)
    if /[ROYGBP]{4}/.match(guess)
      @valid_guess = true
    else
      puts "Please enter only available colors."
    end
    guess
  end
end

def main
  game = Mastermind.new
  game.print_instructions
  secret_code = SecretCode.new.generate_code
  input = Input.new
  user_guess = input.input_guess

  puts "\tFor the purposes of this PR, I'm going to tell you the secret code:
        #{secret_code.join}.

        The number of times each color appears in the code is #{game.color_count(secret_code)}.
        The number of times each color appears in your guess is #{game.color_count(user_guess.chars)}."
end

if __FILE__ == $0
  main
end
