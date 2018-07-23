require_relative '../lib/commands'

RSpec.describe Commands do
  let(:command) { Class.new { extend Commands } }

  describe '#quit_game' do
    it 'quits the game' do
      expect(command).to receive(:quit_message).and_return("So long for now!")
      command.quit_game
    end
  end
end
