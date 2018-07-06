class Guess
  def initialize(guess)
    @guess = guess.upcase
  end

  def to_s
    @guess
  end

  def quit?
    @guess == "QUIT"
  end

  def restart?
    @guess == "RESTART"
  end
end
