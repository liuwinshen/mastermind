class GuessChecker
  attr_reader :current_guess, :original_code, :current_code, :pins

  def initialize(original_code)
    @original_code = original_code
    @current_guess = ''
    @current_code = ''
    @pins = {}
  end

  def check_red(guess, code)
    cloned_guess = guess.clone
    cloned_code = code.clone
    red_count = 0

    cloned_guess.length.times do |i|
      if cloned_guess[i] == cloned_code[i]
        red_count += 1
        cloned_guess[i], cloned_code[i] = "-", "-"
      end
    end
    @current_guess = cloned_guess
    @current_code = cloned_code
    red_count
  end

  def check_white(guess, code)
    cloned_guess = guess.clone
    cloned_code = code.clone
    white_count = 0

    cloned_guess.length.times do |i|
      if cloned_guess[i].match(/[A-Z]/)
        if cloned_code.include?(cloned_guess[i])
          white_count += 1
          index = cloned_code.index(cloned_guess[i])
          cloned_guess[i], cloned_code[index] = "-", "-"
        end
      end
    end
    white_count
  end

  def get_feedback(guess)
    red_count = check_red(guess, @original_code)
    white_count = check_white(@current_guess, @current_code)
    @pins = {:red => red_count, :white => white_count}
  end
end
