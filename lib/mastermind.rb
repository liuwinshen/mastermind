require_relative './user_input'
require_relative './guess_validator'
require_relative './guess_checker'

class Mastermind
  attr_reader :restart_game

  def initialize(code)
    @code = code
    @validator = GuessValidator.new
    @guess_checker = GuessChecker.new(code)
    @remaining_guesses = 10
    @past_guesses = []
    @restart_game = false
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
      input = get_guess
      guess = input.content

      if input.quit?
        quit
        break
      end

      if input.restart?
        restart
        break
      end

      loop_til_valid(guess)
      @remaining_guesses -= 1
    end
    #     feedback = @guess_checker.get_feedback(guess)
    #     @guess_checker.print_feedback
    #     if feedback[:red] == 4
    #       puts "You win! The code was #{@code}."
    #       break
    #     end
    #     log_guess(guess)
    #     @remaining_guesses -= 1
    #   else
    #     puts @validator.validate(guess)
    #     get_guess
    #   end
    # end
    #
    # if @input.taking_guesses == false
    #   return
    # elsif feedback[:red] != 4 && @remaining_guesses == 0
    #   puts "Sorry, the code was #{@code}."
    # end
    #
    # replay
  end

  def get_guess
    puts "Make a guess using available colors: "
    input = gets.chomp
    UserInput.new(input)
  end

  def loop_til_valid(guess)
    until @validator.valid?(guess)
      puts @validator.validate(guess)
      guess = get_guess.content
    end
  end

  def results(guess)
    @guess_checker.get_feedback(guess)
  end

  def log_guess(guess)
    @past_guesses << guess
    puts "Your previous guesses were #{@past_guesses}."
  end

  def replay
    puts "Would you like to play again? (y/n) "
    restart if gets.chomp.match(/[yY]/)
  end

  def quit
    puts "So long for now!"
    exit
  end

  def restart
    puts "New game coming right up."
    @restart_game = true
  end
end
