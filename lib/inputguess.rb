class InputGuess
  def guess(colors)
    valid_guess = false
    until valid_guess
      print "Make a guess using available colors #{colors}: "
      user_input = clean_guess(gets.chomp)
      return user_input if user_input == "QUIT" || user_input == "NEW"
      if validate_length(user_input) && validate_colors(user_input, colors)
        valid_guess = true
      else
        puts "Please enter four colors using only their first letters."
      end
    end
    user_input
  end

  def clean_guess(guess)
    guess.upcase.gsub(/[\W]/, "")
  end

  def validate_length(guess)
    guess.length == 4
  end

  def validate_colors(guess, colors)
    guess.chars.all? { |c| colors.include?(c) }
  end
end
