class GuessChecker
  attr_reader :pins
  
  def initialize(guess, code)
    @current_guess = guess
    @check_code = code.clone
    @pins = {}
  end

  def check_red(guess = @current_guess, code = @check_code)
    red_count = 0
    guess.length.times do |i|
      if guess[i] == code[i]
        red_count += 1
        guess[i], code[i] = "-", "-"
      end
    end
    @current_guess = guess
    @check_code = code
    red_count
  end

  def check_white(guess = @current_guess, code = @check_code)
    white_count = 0
    guess.length.times do |i|
      if guess[i].match(/[A-Z]/)
        if code.include?(guess[i])
          white_count += 1
          index = code.index(guess[i])
          guess[i], code[index] = "-", "-"
        end
      end
    end
    white_count
  end

  def get_feedback(guess = @current_guess, code = @check_code)
    red_count = check_red(guess, code)
    white_count = check_white(guess, code)
    @pins = {:red => red_count, :white => white_count}
  end

  def print_feedback(pins = @pins)
    puts "Red pins: #{pins[:red]} \nWhite pins: #{pins[:white]}"
  end
end
