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
end

RSpec.describe Input do
  it "only accepts letters from input" do
    input = Input.new
    expect(input.clean_guess("abcd")).to eq("ABCD")
    #expect{input.clean_guess("1234")}.to output(/Please enter only letters./).to_stdout
  end

  it "only accepts the exact number of allowable elements" do
    input = Input.new
    expect{input.validate_length("ROYRR")}.to output(/Please enter only four colors/).to_stdout
    expect(input.valid_guess).to eq(false)
  end

  it "only accepts available colors in input" do
    input = Input.new
    expect(input.validate_colors("ROYG")).to eq("ROYG")
    expect{input.validate_colors("RABC")}.to output(/Please enter only available colors/).to_stdout
    expect{input.validate_colors("ABCD")}.to output(/Please enter only available colors/).to_stdout
  end
end
