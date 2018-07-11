require_relative '../lib/user_input'

RSpec.describe UserInput do
  let (:input) { UserInput.new(text) }

  describe '#initialize' do
    let (:text) { 'abcd' }

    it 'upcases the input' do
      expect(input.content).to eq("ABCD")
    end
  end

  describe '#quit?' do
    context 'when "quit" is passed to guess' do
      let (:text) { 'quit' }

      it 'returns true' do
        expect(input.quit?).to eq(true)
      end
    end

    context 'when anything but "quit" is passed' do
      let (:text) { 'get me outta here' }

      it 'returns false' do
        expect(input.quit?).to eq(false)
      end
    end
  end

  describe '#restart?' do
    context 'when "restart" is passed' do
      let (:text) { 'restart' }

      it 'returns true' do
        expect(input.restart?).to eq(true)
      end
    end

    context 'when anything but "restart" is passed' do
      let (:text) { 'take two' }

      it 'returns false' do
        expect(input.restart?).to eq(false)
      end
    end
  end
end
