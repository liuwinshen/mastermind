require_relative './mastermind'

RSpec.describe Mastermind do
  it "prints game instructions" do
    game = Mastermind.new
    expect {game.print_instructions}.to output(/Welcome to Mastermind!/).to_stdout
  end
end

RSpec.describe Code do
  code = Code.new.generate_code

  it "generates a random code of length 4" do
    expect(code.length).to eq (4)
  end

  it "generates a code using at least one of the possible colors" do
    code.each do |char|
      expect(["R", "O", "Y", "G", "B", "P"].include?(char)).to eq(true)
    end
  end
end

RSpec.describe Input do
  input = Input.new

  it "validates letters" do
    expect(input.clean_guess("abcd")).to eq("ABCD")
    #expect{input.clean_guess("1234")}.to output(/Please enter only letters./).to_stdout
  end

  it "validates the exact number of allowable elements" do
    expect{input.validate_length("ROYRR")}.to output(/Please enter only four colors/).to_stdout
    expect(input.valid_guess).to eq(false)
  end

  it "validates available colors" do
    expect(input.validate_colors("ROYG")).to eq("ROYG")
    expect(input.valid_guess).to eq(true)
    expect{input.validate_colors("ROBC")}.to output(/Please enter only available colors/).to_stdout
    expect(input.valid_guess).to eq(false)
    expect{input.validate_colors("ABCD")}.to output(/Please enter only available colors/).to_stdout
    expect(input.valid_guess).to eq(false)
    expect(input.validate_colors("RRRR")).to eq("RRRR")
    expect(input.valid_guess).to eq(true)
  end

  # it "only accepts validated input" do
  #   test_input = Input.new.input_guess
  #   expect(test_input).to eq(test_input.user_input)
  # end
end
