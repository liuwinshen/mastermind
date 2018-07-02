class Mastermind
  attr_reader :restart

  def initialize(code, input, guess_checker)
    @game_code = code
    @input_stream = input
    @guess_checker = guess_checker
    @remaining_guesses = 10
    @past_guesses = []
  end

  def print_instructions(long_colors)
    puts "\tWelcome to Mastermind! The object of the game is to guess a 4-color code
        (order matters) within 10 guesses. The available colors are #{long_colors}.
        Colors may be used in the code more than once or not at all.

        To make a guess: type the first letter of each color you're guessing in caps.
        For example, if you want to guess red, orange, yellow, red, enter 'ROYR'.

        After each guess, you will receive feedback in the form of colored pins,
        letting you know:
          \t- how many colors are correct but in the wrong position (white pins)
          \t- how many colors are correct and in the right position (red pins)

        To quit the game, type 'quit'. To start a new game, type 'restart'."
  end

  def loop_guesses(short_colors)
    feedback = ""
    while @remaining_guesses > 0
      puts "You have #{@remaining_guesses} guesses remaining."
      guess = @input_stream.guess(short_colors)

      if @input_stream.taking_guesses
        feedback = @guess_checker.get_feedback(guess)
        @guess_checker.print_feedback
        if feedback[:red] == 4
          puts "You win! The code was #{@game_code}."
          break
        end
        log_guess(guess)
        @remaining_guesses -= 1
      else
        return
      end
    end

    if @input_stream.taking_guesses == false
      return
    elsif feedback[:red] != 4 && @remaining_guesses == 0
      puts "Sorry, the code was #{@game_code}."
    end

    replay
  end

  def log_guess(guess)
    @past_guesses << guess
    puts "Your previous guesses were #{@past_guesses}."
  end

  def replay
    puts "Would you like to play again? (y/n) "
    @input_stream.restart_game if gets.chomp.match(/[yY]/)
  end
end
