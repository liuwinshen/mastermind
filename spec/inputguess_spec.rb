require_relative '../lib/inputguess'

RSpec.describe InputGuess do
  let(:input) { InputGuess.new }

  describe "#clean_guess" do
    it "converts input to uppercase" do
      expect(input.clean_guess("abcd")).to eq("ABCD")
    end

    it "removes punctuation" do
      expect(input.clean_guess("p, r, o, g")).to eq("PROG")
    end

    context "when input is numbers"
      it "prints validation error" do
        expect{input.clean_guess(1234)}.to output(/Please enter only letters./).to_stdout
      end
  end

  describe "#validate_length" do
    context "when input is correct length"
      it "returns true" do
        expect(input.validate_length("ROYR")).to eq(true)
      end

    context "when input is too long or short"
      it "returns false" do
        expect(input.validate_length("ROYRR")).to eq(false)
        expect(input.validate_length("RO")).to eq(false)
      end
  end

  describe "#validate_colors" do
    it "accepts available colors" do
      expect(input.validate_colors("ROYG")).to eq(true)
      expect(input.validate_colors("RRRR")).to eq(true)
    end

    it "rejects non-available colors" do
      expect{input.validate_colors("ROBC")}.to output(/Please enter only available colors/).to_stdout
      expect{input.validate_colors("ABCD")}.to output(/Please enter only available colors/).to_stdout
    end
  end
end
