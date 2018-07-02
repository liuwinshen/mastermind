class GuessChecker
  attr_reader :current_guess, :original_code, :check_code, :pins

  def initialize(original_code)
    @current_guess = ""
    @original_code = original_code
    @check_code = ""
    @pins = {}
  end

  def check_red(guess, code)
    red_count = 0
    guess.length.times do |i|
      if guess[i] == code[i]
        red_count += 1
        guess[i], code[i] = "-", "-"
      end
    end
    red_count
  end

  def check_white(guess, code)
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
    @check_code = @original_code
    white_count
  end

  def get_feedback(guess)
    @current_guess = guess.clone
    @check_code = original_code.clone
    red_count = check_red(@current_guess, @check_code)
    white_count = check_white(@current_guess, @check_code)
    @pins = {:red => red_count, :white => white_count}
  end

  def print_feedback
    puts "Red pins: #{@pins[:red]} \nWhite pins: #{@pins[:white]}"
  end
end
