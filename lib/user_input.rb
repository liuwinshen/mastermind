class UserInput
  attr_reader :content

  def initialize(input)
    @content = input.upcase
  end

  def quit?
    @content == "QUIT"
  end

  def restart?
    @content == "RESTART"
  end
end
