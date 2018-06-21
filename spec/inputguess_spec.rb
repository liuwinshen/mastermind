require_relative '../lib/inputguess'

RSpec.describe InputGuess do
  let(:input) { InputGuess.new }

  it "validates letters" do
    expect(input.clean_guess("abcd")).to eq("ABCD")
    expect{input.clean_guess(1234)}.to output(/Please enter only letters./).to_stdout
  end

  it "validates the exact number of allowable elements" do
    expect(input.validate_length("ROYRR")).to eq(false)
    expect(input.validate_length("ROYR")).to eq(true)
  end

  it "accepts available colors" do
    expect(input.validate_colors("ROYG")).to eq(true)
    expect(input.validate_colors("RRRR")).to eq(true)
  end

  it "rejects any non-available colors" do
    expect{input.validate_colors("ROBC")}.to output(/Please enter only available colors/).to_stdout
    expect{input.validate_colors("ABCD")}.to output(/Please enter only available colors/).to_stdout
  end
end
