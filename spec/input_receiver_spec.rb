require_relative '../lib/input_receiver'

RSpec.describe InputReceiver do
  let(:input) { InputReceiver.new }

  describe '#get_input' do
    it 'gets user input' do
      expect(input.user_input).to_not eq(nil)
    end
  end
end
