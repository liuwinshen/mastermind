require_relative '../lib/mastermind'

RSpec.describe Mastermind do
  let(:game) { Mastermind.new }

  describe "#print_instructions" do
    it "prints how to play" do
      expect {game.print_instructions}.to output(/After each guess/).to_stdout
    end
  end

  describe "#color_count" do
    it "counts how many times color appears in a given code" do
      expect(game.color_count(["R", "O", "Y", "G", "B", "P"])).to eq ({:R => 1, :O => 1, :Y => 1, :G => 1, :B => 1, :P => 1})
    end

    it "counts repeated colors in code" do
      expect(game.color_count(["P", "P", "P", "P"])).to eq ({:P => 4})
      expect(game.color_count(["R", "O", "B", "R", "B", "B"])).to eq ({:R => 2, :O => 1, :B => 3})
    end
  end

  describe "#white_pins" do
    context "when guess matches some colors in code"
      it "counts number of correct colors regardless of position" do
        code_color_count = game.color_count(["R", "O", "Y", "G"])
        guess_color_count = game.color_count("RROO")
        expect(game.white_pins(code_color_count, guess_color_count)).to eq (2)

        code_color_count = game.color_count(["R", "R", "Y", "G"])
        guess_color_count = game.color_count("RRRO")
        expect(game.white_pins(code_color_count, guess_color_count)).to eq (2)

        code_color_count = game.color_count(["R", "O", "O", "O"])
        guess_color_count = game.color_count("RROO")
        expect(game.white_pins(code_color_count, guess_color_count)).to eq (3)
      end

    context "when guess matches no colors in code"
      it "returns zero" do
        code_color_count = game.color_count(["R", "O", "Y", "G"])
        guess_color_count = game.color_count("BPBP")
        expect(game.white_pins(code_color_count, guess_color_count)).to eq (0)
      end
  end
end
