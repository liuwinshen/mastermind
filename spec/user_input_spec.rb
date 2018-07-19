require_relative '../lib/user_input'

RSpec.describe UserInput do
  let(:input) { Class.new { extend UserInput } }

  describe '#get_upcase_input' do
    let(:input) { double('UserInput').as_null_object }

    it 'gets upcased user input' do
      allow(input).to receive(:gets).and_return('abcd')

      expect(input).to receive(:get_upcase_input).and_return('ABCD')
      input.get_upcase_input
    end
  end

  describe '#quit?' do
    context 'when "quit" is passed' do
      it 'returns true' do
        expect(input.quit?('QUIT')).to eq(true)
      end
    end

    context 'when anything but "quit" is passed' do
      it 'returns false' do
        expect(input.quit?('get me outta here')).to eq(false)
      end
    end
  end

  describe '#restart?' do
    context 'when "restart" is passed' do
      it 'returns true' do
        expect(input.restart?('RESTART')).to eq(true)
      end
    end

    context 'when anything but "restart" is passed' do
      it 'returns false' do
        expect(input.restart?('take two')).to eq(false)
      end
    end
  end
end
