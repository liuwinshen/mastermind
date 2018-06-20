require_relative './mastermind'

RSpec.describe Mastermind do
  game = Mastermind.new
  it "prints game instructions" do
    expect {game.print_instructions}.to output(/After each guess/).to_stdout
  end

  it "counts the number of each color in a given code" do
    expect(game.color_count(["R", "O", "Y", "G"])).to eq ({:R => 1, :O => 1, :Y => 1, :G => 1})
    expect(game.color_count(["P", "P", "P", "P"])).to eq ({:P => 4})
    expect(game.color_count(["R", "O", "B", "R", "B", "B"])).to eq ({:R => 2, :O => 1, :B => 3})
  end

  # it "counts how many colors in the guess match the code" do
  #   expect(game.compare(["R", "O", "Y", "G"], "RROO")).to eq (2)
  # end
end

RSpec.describe SecretCode do
  secret_code = SecretCode.new
  generated_code = secret_code.generate_code

  it "generates a random code of length 4" do
    expect(generated_code.length).to eq (4)
  end

  it "generates a code using at least one of the possible colors" do
    generated_code.each do |char|
      expect(["R", "O", "Y", "G", "B", "P"].include?(char)).to eq(true)
    end
  end
end

RSpec.describe Input do
  input = Input.new

  it "validates letters" do
    expect(input.clean_guess("abcd")).to eq("ABCD")
    expect{input.clean_guess(1234)}.to output(/Please enter only letters./).to_stdout
  end

  it "validates the exact number of allowable elements" do
    expect{input.validate_length("ROYRR")}.to output(/Please enter four colors/).to_stdout
    expect(input.valid_guess).to eq(false)
  end

  it "accepts available colors" do
    input = Input.new
    expect(input.validate_colors("ROYG")).to eq("ROYG")
    expect(input.valid_guess).to eq(true)
    expect(input.validate_colors("RRRR")).to eq("RRRR")
    expect(input.valid_guess).to eq(true)
  end

  it "rejects any non-available colors" do
    input = Input.new
    expect{input.validate_colors("ROBC")}.to output(/Please enter only available colors/).to_stdout
    expect(input.valid_guess).to eq(false)
    expect{input.validate_colors("ABCD")}.to output(/Please enter only available colors/).to_stdout
    expect(input.valid_guess).to eq(false)
  end
end
