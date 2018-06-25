require_relative '../lib/code'

class MockCode < Code
  attr_accessor :code
end

RSpec.describe Code do
  let(:game_code) { MockCode.new }

  describe "#initialize" do
    it "creates code of length 4" do
      expect(game_code.code.length).to eq (4)
    end

    it "uses only available colors" do
      game_code.code.split("").each do |char|
        expect(["R", "O", "Y", "G", "B", "P"].include?(char)).to eq(true)
      end
    end

    describe "#color_count" do
      it "counts how many times color appears in a given code" do
        expect(game_code.color_count("ROYGBP")).to eq ({:R => 1, :O => 1, :Y => 1, :G => 1, :B => 1, :P => 1})
      end

      it "counts repeated colors in code" do
        expect(game_code.color_count("PPPP")).to eq ({:P => 4})
        expect(game_code.color_count("ROBRBB")).to eq ({:R => 2, :O => 1, :B => 3})
      end
    end

    describe "#white_pins" do
      context "when guess matches some colors in code"
        it "returns count of matched colors" do
          expect(game_code.white_pins("ROYG", "RROO")).to eq (2)

          expect(game_code.white_pins("ROOO", "RROO")).to eq (3)
        end

      context "when guess matches no colors in code"
        it "returns zero" do
          expect(game_code.white_pins("ROYG", "BPBP")).to eq (0)
        end
    end

    describe "#red_and_white" do
      context "when guess matches colors and positions in code"
        it "returns count of red and white pins" do
          pins = game_code.red_and_white(4, "ROYG", "RGYO")
          expect(pins[:red]).to eq (2)
          expect(pins[:white]).to eq(2)
        end
    end
  end
end
