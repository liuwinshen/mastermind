require_relative './mastermind'

RSpec.describe Mastermind do
  it "prints game instructions" do
    game = Mastermind.new
    expect {game.print_instructions}.to output(/Welcome to Mastermind!/).to_stdout
  end

  it "generates a random code of length 4" do
    code = Code.new.generate_code
    expect(code.length).to eq (4)
  end

  it "generates a code using at least one of the possible colors" do
    code = Code.new.generate_code
    code.each do |char|
      expect(["R", "O", "Y", "G", "B", "P"].include?(char)).to eq(true)
    end
  end

  it "takes in user input" do
    expect(Input.new.input_guess).not_to eq (nil)
  end

  it "only allows letters in input" do
    expect{Input.new.validate_guess(guess = 123)}.to output(/Please enter only available colors/).to_stdout
    expect{Input.new.validate_guess(guess = "abc")}.to eq("ABC")
  end
end
