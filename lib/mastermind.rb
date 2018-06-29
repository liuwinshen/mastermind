class Mastermind
  attr_reader :restart

  def initialize(code, input)
    @game_code = code
    @game_input = input
    @remaining_guesses = 10
    @past_guesses = []
    @restart = false
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
    while @remaining_guesses > 0
      puts "You have #{@remaining_guesses} guesses remaining."
      guess = @game_input.guess(short_colors)
      quit if guess == "QUIT"
      if guess == "RESTART"
        restart_game
        break
      end

      feedback = compare(guess)
      if feedback[:red] == 4
        win
        break
      end
      log_guess(guess)
      @remaining_guesses -= 1
    end
    loss(guess)
  end

  def log_guess(guess)
    @past_guesses << guess
    puts "Your previous guesses were #{@past_guesses}."
  end

  def color_count(code)
    color_count = Hash.new(0)
    code.each_char do |c|
      color_key = c.to_sym
      color_count[color_key] += 1
      end
    color_count
  end

  def white(code, guess)
    code_color_count = color_count(code)
    guess_color_count = color_count(guess)

    white_count = 0
    guess_color_count.each do |k, v|
      if v <= code_color_count[k]
        white_count += v
      elsif v > code_color_count[k]
        white_count += code_color_count[k]
      end
    end
    white_count
  end

  def red_and_white(white_count, code, guess)
    red_count = 0

    guess.length.times do |i|
      if guess[i] == code[i]
        red_count += 1
        if white_count > 0
          white_count -= 1
        end
      end
    end
    puts "Red pins: #{red_count} \nWhite pins: #{white_count}"
    {:red => red_count, :white => white_count}
  end

  def compare(guess)
    white_count = white(@game_code, guess)
    red_and_white(white_count, @game_code, guess)
  end
  
  def win
    puts "You win! The code was #{@game_code}. Would you like to play again? (y/n) "
    replay
  end

  def loss(guess)
    if compare(guess)[:red] != 4 && @remaining_guesses == 0
      puts "Sorry, the code was #{@game_code}. Would you like to play again? (y/n) "
      replay
    end
  end

  def replay
    restart_game if gets.chomp.match(/[yY]/)
  end

  def quit
    puts "So long for now!"
    exit
  end

  def restart_game
    puts "New game coming right up."
    @restart = true
  end
end
