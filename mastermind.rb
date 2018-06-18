class Mastermind
  def print_instructions
    puts "Welcome to Mastermind! The object of the game is to guess a 4-color code "\
        "within 10 guesses. The available colors are red, orange, yellow, green, "\
        "blue, and purple. Colors may be used in the code more than once or not at all."\

        "\nTo make a guess: type the first letter of each color you're guessing in caps. "\
        "For example, if you want to guess 'red, orange, yellow, red,' type 'ROYR'."\

        "\nAfter each guess, you will receive feedback letting you know:"\
          "\n\t- how many colors are correct but in the wrong position"\
          "\n\t- how many colors are correct and in the right position."\

        "\nTo quit the game, type '/q'. To start a new game, type '/r'."
    end

  def generate_code
    code = []
    colors = ["R", "O", "Y", "G", "B", "P"]
    while code.length < 4 do
      random_index = Random.rand(0..5)
      code << colors[random_index]
    end
    return code
  end
end
