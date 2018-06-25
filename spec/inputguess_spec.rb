require_relative '../lib/inputguess'

RSpec.describe InputGuess do
  let(:input) { InputGuess.new }
  let(:colors) { ["R", "O", "Y", "G", "B", "P"] }

  describe "#clean_guess" do
    it "converts input to uppercase" do
      expect(input.clean_guess("abcd")).to eq("ABCD")
    end

    it "removes punctuation" do
      expect(input.clean_guess("p, r, o, g")).to eq("PROG")
    end

    context "when input is numbers"
      it "prints validation error" do
        expect{input.clean_guess(1234)}.to raise_error(NoMethodError)
      end
  end

  describe "#validate_length" do
    context "when input is correct length"
      it "returns true" do
        expect(input.validate_length("ROYR")).to eq(true)
      end

    it "rejects input that is too long" do
      expect(input.validate_length("ROYRR")).to eq(false)
    end

    it "rejects input that is too short" do
      expect(input.validate_length("RO")).to eq(false)
    end
  end

  describe "#validate_colors" do
    it "accepts available colors" do
      expect(input.validate_colors("ROYG", colors)).to eq(true)
      expect(input.validate_colors("RRRR", colors)).to eq(true)
    end

    it "rejects non-available colors" do
      expect(input.validate_colors("ROBC", colors)).to eq(false)
      expect(input.validate_colors("ABCD", colors)).to eq(false)
    end
  end
end
