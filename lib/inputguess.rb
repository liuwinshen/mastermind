class InputGuess
  def guess(colors)
    valid_guess = false
    until valid_guess
      print "Make a guess using available colors #{colors}: "
      user_input = clean_guess(gets.chomp)
      quit if user_input == "QUIT"
      if user_input == "RESTART"
        restart_game
        break
      end
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

  def quit
    puts "So long for now!"
    exit
  end

  def restart_game
    puts "New game coming right up."
    # @restart = true
  end
end
