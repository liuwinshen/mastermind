class UserInput
  attr_reader :guess

  def initialize(input)
    @guess = input.upcase
  end

  def quit?
    @guess == "QUIT"
  end

  def restart?
    @guess == "RESTART"
  end
end
