require_relative '../lib/mastermind'
require_relative '../lib/code'
require_relative '../lib/inputguess.rb'

RSpec.describe Mastermind do
  let(:code) { Code.new }
  let(:input) { InputGuess.new }
  let(:game) { Mastermind.new(code, input) }
  let(:long_colors) { ["red", "orange", "yellow", "green", "blue", "purple"] }
  let(:short_colors) { ["R", "O", "Y", "G", "B", "P"] }

  describe "#print_instructions" do
    it "prints how to play" do
      expect {game.print_instructions(long_colors)}.to output(/After each guess/).to_stdout
    end
  end

  describe "#quit" do
    it "ends game" do
      expect {game.quit}.to output(/So long for now!/).to_stdout
    end
  end
end
