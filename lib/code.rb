class Code
  attr_reader :colors
  
  def initialize
    @colors = ["R", "O", "Y", "G", "B", "P"]
  end

  def self.generate(colors)
    Array.new(4).map { |_| colors.sample }
  end
end
