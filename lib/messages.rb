module Messages
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

  def guess_prompt
    puts "Make a guess using available colors: "
  end

  def start_turn_message(remaining_guesses)
    puts "You have #{remaining_guesses} guesses remaining."
  end

  def validation_message(errors)
    puts errors
  end

  def pins_message(feedback)
    puts "Red pins: #{feedback[:red]} \nWhite pins: #{feedback[:white]}"
  end

  def past_guess_message(past_guesses)
    puts "Your previous guesses were #{past_guesses}."
  end

  def replay_prompt
    puts "Would you like to play again? (y/n) "
  end

  def quit_message
    puts "So long for now!"
  end

  def restart_message
    puts "New game coming right up."
  end

  def win_message(code)
    puts "You win! The code was #{code}."
  end

  def loss_message(code)
    puts "Sorry, you lost. The code was #{code}."
  end
end
