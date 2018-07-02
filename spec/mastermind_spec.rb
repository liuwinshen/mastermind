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

  describe "#quit" do
    it "ends game" do
      expect {game.quit}.to output(/So long for now!/).to_stdout
    end
  end
end
