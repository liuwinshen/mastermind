class InputReceiver
  def get_input(colors = ["R", "O", "Y", "G", "B", "P"])
    valid_guess = false
    until valid_guess
      print "Make a guess using available colors #{colors}: "
      user_input = gets.chomp
    end
    user_input
  end
end
