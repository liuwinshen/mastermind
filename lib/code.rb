class Code
  attr_reader :short_colors, :long_colors, :code

  def initialize(short_colors = ["R", "O", "Y", "G", "B", "P"],
                long_colors = ["red", "orange", "yellow", "green", "blue", "purple"])
    @short_colors = short_colors
    @long_colors = long_colors
    @code = Array.new(4).map { |_| @short_colors.sample }.join
  end

  def color_count(code)
    color_count = Hash.new(0)
    code.each_char do |c|
      color_key = c.to_sym
      color_count[color_key] += 1
      end
    color_count
  end

  def white_pins(code, guess)
    code_color_count = color_count(code)
    guess_color_count = color_count(guess)

    white_count = 0
    guess_color_count.each do |k, v|
      if v <= code_color_count[k]
        white_count += v
      elsif v > code_color_count[k]
        white_count += code_color_count[k]
      end
    end
    white_count
  end

  def red_and_white(white_count, code, guess)
    red_count = 0
    i = 0
    while i < guess.length do
      if guess[i] == code[i]
        red_count += 1
        if white_count > 0
          white_count -= 1
        end
      end
      i += 1
    end
    puts "Red pins: #{red_count} \nWhite pins: #{white_count}"
    {:red => red_count, :white => white_count}
  end
end
