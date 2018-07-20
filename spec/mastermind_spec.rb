require_relative '../lib/mastermind'
require_relative '../lib/code'
require_relative '../lib/guess_checker'

RSpec.describe Mastermind do
  let(:code) { CodeGenerator.new }
  let(:guess_checker) { GuessChecker.new(code.secret_code) }
  let(:long_colors) { code.long_colors }
  let(:short_colors) { code.short_colors }
  let(:game) { Mastermind.new(code.secret_code, long_colors) }
  let(:input) { get_upcase_input }

  describe '#exit_game' do
    context 'when "QUIT" is passed' do
      it 'calls quit' do
        allow(input).to receive(:get_input).and_return("QUIT")
        expect(game).to receive(:quit)
        game.exit_game(input)
      end

      it 'does not call restart' do
        input.value = "QUIT"
        expect(game).not_to receive(:restart)
        game.exit_game(input)
      end
    end

    context 'when "RESTART" is passed' do
      it 'calls restart' do
        input.value = "RESTART"
        expect(game).to receive(:restart)
        game.exit_game(input)
      end

      it 'does not call quit' do
        input.value = "RESTART"
        expect(game).not_to receive(:quit)
        game.exit_game(input)
      end
    end

    context 'when anything but QUIT or RESTART are passed' do
      it 'does not call quit or restart' do
        input.value = 'HELLO'
        expect(game).not_to receive(:quit)
        expect(game).not_to receive(:restart)
        game.exit_game(input)
      end
    end
  end
end
