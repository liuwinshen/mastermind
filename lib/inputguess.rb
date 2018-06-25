class InputGuess
  def initialize
    @valid_guess = false
    @remaining_guesses = 10
    @past_guesses = []
  end

  def input(short_colors)
    until @valid_guess
      print "You have #{@remaining_guesses} guesses remaining. Make a guess using available colors #{short_colors}: "
      user_input = clean_guess(gets.chomp)
      if validate_length(user_input) && validate_colors(user_input, short_colors)
        @valid_guess = true
        @remaining_guesses -= 1
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

  # def play(short_colors)
  #   while @guess_count <= 10
  #     input(short_colors)
  #
  #     @guess_count += 1
  #   end
  # end
end
