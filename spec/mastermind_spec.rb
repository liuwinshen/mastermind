require_relative '../lib/mastermind'
require_relative '../lib/code'
require_relative '../lib/guess_checker'

RSpec.describe Mastermind do
  let(:code) { CodeGenerator.new }
  let(:guess_checker) { GuessChecker.new(code.secret_code) }
  let(:long_colors) { code.long_colors }
  let(:short_colors) { code.short_colors }
  let(:game) { Mastermind.new(code.secret_code) }

  describe '#win?' do
    let(:game) { Mastermind.new("ROYG") }
    let(:feedback) { game.check(text) }

    context 'when feedback is a win' do
      let(:text) { "ROYG" }

      it 'returns true' do
        expect(game.win?(feedback)).to eq(true)
      end
    end

    context 'when feedback is a not a win' do
      let(:text) { "BBBB" }

      it 'returns false' do
        expect(game.win?(feedback)).to eq(false)
      end
    end
  end
end
