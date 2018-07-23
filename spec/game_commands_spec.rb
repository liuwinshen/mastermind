require_relative '../lib/game_commands'

RSpec.describe GameCommands do
  let(:command) { Class.new { extend GameCommands } }

  describe '#replay' do
    context 'when input is y' do
      it 'calls restart' do
        allow(command).to receive(:gets).and_return('y')
        expect(command).to receive(:restart)
        command.replay
      end
    end

    context 'when input is not y' do
      it 'will not restart' do
        allow(command).to receive(:gets).and_return('n')
        expect(command).not_to receive(:restart)
        command.replay
      end
    end
  end

  describe '#quit' do
    it 'quits the game' do
      expect(command).to receive(:quit_message).and_return("So long for now!")
      command.quit
    end
  end
end
