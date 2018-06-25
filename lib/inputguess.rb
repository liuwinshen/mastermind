class InputGuess
  attr_reader :valid_guess, :guess_count

  def initialize
    @valid_guess = false
  end

  def input(short_colors)
    until @valid_guess
      print "Make a guess using available colors #{short_colors}: "
      user_input = clean_guess(gets.chomp)
      if validate_length(user_input)
        validate_colors(user_input)
      else
        puts "Please enter four colors using only their first letters."
      end
    end
    user_input
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
    guess.length == 4
  end

  def validate_colors(guess)
    if /[ROYGBP]{4}/.match(guess)
      @valid_guess = true
    else
      puts "Please enter only available colors."
    end
  end
end
