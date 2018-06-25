class Code
  attr_reader :short_colors, :long_colors, :code, :red_count, :white_count

  def initialize(colors = ["R", "O", "Y", "G", "B", "P"])
    @short_colors = colors
    @long_colors = ["red", "orange", "yellow", "green", "blue", "purple"]
    @code = Array.new(4).map { |_| @short_colors.sample }.join
    @white_count = 0
    @red_count = 0
  end

  def color_count(code)
    color_count = Hash.new(0)
    code.each_char do |color|
      color_key = color.to_sym
      color_count[color_key] += 1
      end
    color_count
  end

  def white_pins(code, guess)
    code_color_count = color_count(code)
    guess_color_count = color_count(guess)
    
    @white_count = 0
    guess_color_count.each do |key, value|
      if value <= code_color_count[key]
        @white_count += value
      elsif value > code_color_count[key]
        @white_count += code_color_count[key]
      end
    end
    @white_count
  end

  def red_and_white(white_pins, code, guess)
    @red_count = 0
    @white_count = white_pins
    i = 0
    while i < guess.length do
      if guess[i] == code[i]
        @red_count += 1
        @white_count -= 1
      end
      i += 1
    end
    {:red => @red_count, :white => @white_count}
  end
end
