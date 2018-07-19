require_relative './messages'

module UserInput
  include Messages

  def get_upcase_input
    guess_prompt
    gets.chomp.upcase
  end

  def quit?(value)
    value.upcase == "QUIT"
  end

  def restart?(value)
    value.upcase == "RESTART"
  end
end
