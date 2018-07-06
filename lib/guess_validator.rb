class GuessValidator
  attr_reader :errors

  def initialize(guess)
    @guess = guess.to_s
    @errors = []
    @colors = ["R", "O", "Y", "G", "B", "P"]
    @validated = false
  end

  def validate!
    @validated = true
    numbers! if numbers?
    punctuation! if punctuation?
    too_short! if too_short?
    too_long! if too_long?

    unless (numbers? || punctuation?)
      invalid_colors! if invalid_colors?
    end
  end

  def valid?
    raise Exception.new('Must run #validate! before calling #valid?') unless @validated
    @errors.empty?
  end

  def numbers?
    @guess.match(/[\d]/)
  end

  def numbers!
    @errors << "Numbers are not allowed."
  end

  def punctuation?
    @guess.match(/[^\w]/)
  end

  def punctuation!
    @errors << "Punctuation is not allowed."
  end

  def too_short?
    @guess.length < 4
  end

  def too_short!
    @errors << "Your guess is too short. Please enter 4 letters."
  end

  def too_long?
    @guess.length > 4
  end

  def too_long!
    @errors << "Your guess is too long. Only 4 letters are allowed."
  end

  def invalid_colors!
    @errors << "Your guess has invalid colors. Please use only available colors."
  end

  def invalid_colors?
    (@guess.chars - @colors).any?
  end
end
