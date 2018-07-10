class GuessValidator
  def initialize
    @colors = ["R", "O", "Y", "G", "B", "P"]
  end

  def valid?(guess)
    errors = validate(guess)
    errors.empty?
  end

  def validate(guess)
    errors = []
    if numbers?(guess)
      errors << "Numbers are not allowed."
    end

    if punctuation?(guess)
      errors << "Punctuation is not allowed."
    end

    if too_short?(guess)
      errors << "Your guess is too short. Please enter 4 letters."
    end

    if too_long?(guess)
      errors << "Your guess is too long. Only 4 letters are allowed."
    end

    unless (numbers?(guess) || punctuation?(guess))
      if invalid_colors?(guess)
        errors << "Your guess has invalid colors. Please use only available colors."
      end
    end
    errors
  end

  def numbers?(guess)
    guess.match(/[\d]/)
  end

  def punctuation?(guess)
    guess.match(/[^\w]/)
  end

  def too_short?(guess)
    guess.length < 4
  end

  def too_long?(guess)
    guess.length > 4
  end

  def invalid_colors?(guess)
    (guess.chars - @colors).any?
  end
end
