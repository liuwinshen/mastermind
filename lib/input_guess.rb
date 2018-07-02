class InputGuess
  attr_reader :taking_guesses

  def initialize
    @taking_guesses = true
  end

  def guess(colors)
    valid_guess = false
    until valid_guess
      print "Make a guess using available colors #{colors}: "
      user_input = clean_guess(gets.chomp)
      game_command?(user_input)

      if @taking_guesses
        if validate_length(user_input) && validate_colors(user_input, colors)
        valid_guess = true
        else
          puts "Please enter four colors using only their first letters."
        end
      else
        return
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

  def game_command?(user_input)
    quit if user_input == "QUIT"
    restart_game if user_input == "RESTART"
  end

  def quit
    puts "So long for now!"
    exit
  end

  def restart_game
    puts "New game coming right up."
    @taking_guesses = false
  end
end
