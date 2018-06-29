require_relative '../lib/mastermind'
require_relative '../lib/code'
require_relative '../lib/inputguess'

RSpec.describe Mastermind do
  let(:code) { CodeGenerator.new }
  let(:input) { InputGuess.new }
  let(:game) { Mastermind.new(code.secret_code, input) }
  let(:long_colors) { ["red", "orange", "yellow", "green", "blue", "purple"] }
  let(:short_colors) { ["R", "O", "Y", "G", "B", "P"] }

  describe "#print_instructions" do
    it "prints how to play" do
      expect {game.print_instructions(long_colors)}.to output(/After each guess/).to_stdout
    end
  end

  describe "#color_count" do
    it "counts how many times color appears in a given code" do
      expect(game.color_count("ROYGBP")).to eq ({:R => 1, :O => 1, :Y => 1, :G => 1, :B => 1, :P => 1})
    end

    it "counts repeated colors in code" do
      expect(game.color_count("PPPP")).to eq ({:P => 4})
      expect(game.color_count("ROBRBB")).to eq ({:R => 2, :O => 1, :B => 3})
    end
  end

  describe "#white_pins" do
    context "when guess matches some colors in code"
      it "returns count of matched colors" do
        expect(game.white("ROYG", "RROO")).to eq (2)

        expect(game.white("ROOO", "RROO")).to eq (3)

        expect(game.white("BYYG", "BBYG")).to eq (3)
      end

    context "when guess matches no colors in code"
      it "returns zero" do
        expect(game.white("ROYG", "BPBP")).to eq (0)
      end
  end

  describe "#red_and_white" do
    context "when guess matches colors and positions in code"
      it "returns count of red and white pins" do
        pins = game.red_and_white(4, "ROYG", "RGYO")
        expect(pins[:red]).to eq (2)
        expect(pins[:white]).to eq (2)
      end

    context "all white pins are in the right position"
      it "returns no white pins" do
        pins = game.red_and_white(3, "BYYG", "BBYG")
        expect(pins[:red]).to eq (3)
        expect(pins[:white]).to eq (0)
      end
  end

  describe "#loop_guesses" do
    xit "gets and checks user guesses until no guesses remain" do
      game.remaining_guesses = 2
    end
  end

  describe "#restart_game" do
    it "starts false, ends true" do
      expect(game.restart).to eq (false)
      game.restart_game
      expect(game.restart).to eq (true)
    end
  end

  describe "#compare" do
    it "gets red and white pins for guess" do
      expect(game.compare("RORO")).to include(:red, :white)
    end
  end

  describe "#quit" do
    it "ends game" do
      expect {game.quit}.to output(/So long for now!/).to_stdout
    end
  end
end
