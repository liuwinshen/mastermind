class CodeGenerator
  attr_reader :short_colors, :long_colors, :code

  def initialize(short_colors = ["R", "O", "Y", "G", "B", "P"],
                long_colors = ["red", "orange", "yellow", "green", "blue", "purple"])
    @short_colors = short_colors
    @long_colors = long_colors
  end

  def secret_code
    Array.new(4).map { |_| @short_colors.sample }.join
  end
end
