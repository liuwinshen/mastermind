require_relative '../lib/mastermind'
require_relative '../lib/code'
require_relative '../lib/guess_checker'

RSpec.describe Mastermind do
  let(:code) { CodeGenerator.new }
  let(:guess_checker) { GuessChecker.new(code.secret_code) }
  let(:game) { Mastermind.new(code.secret_code) }
  let(:long_colors) { code.long_colors }
  let(:short_colors) { code.short_colors }

  describe "#print_instructions" do
    it "prints how to play" do
      expect {game.print_instructions(long_colors)}.to output(/After each guess/).to_stdout
    end
  end

  before do
    $stdin = StringIO.new('RORO')
  end

  after do
    $stdin = STDIN
  end

  describe '#get_guess' do
    it 'prompts and returns user guess' do
      expect(game.get_guess).to eq('RORO')
    end
  end
end
