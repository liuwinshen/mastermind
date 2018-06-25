require_relative '../lib/mastermind'

RSpec.describe Mastermind do
  let(:game) { Mastermind.new }

  describe "#print_instructions" do
    it "prints how to play" do
      expect {game.print_instructions(["red", "orange", "yellow", "green", "blue", "purple"])}.to output(/After each guess/).to_stdout
    end
  end

  describe "#play" do
    xit "returns game outcome" do
      expect (game.play).to eq ()
    end
  end
end
