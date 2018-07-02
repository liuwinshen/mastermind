require_relative '../lib/mastermind'
require_relative '../lib/code'
require_relative '../lib/input_guess'
require_relative '../lib/guess_checker'

RSpec.describe Mastermind do
  let(:code) { CodeGenerator.new }
  let(:input) { InputGuess.new }
  let(:guess_checker) { GuessChecker.new(code.secret_code) }
  let(:game) { Mastermind.new(code.secret_code, input, guess_checker) }
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
end
