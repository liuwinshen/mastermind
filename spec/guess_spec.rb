require_relative '../lib/guess'

RSpec.describe Guess do
  describe '#to_s' do
    it 'upcases the guess' do
      guess = Guess.new("abcd")

      expect(guess.to_s).to eq("ABCD")
    end
  end

  describe '#quit?' do
    it 'returns true if "quit" is passed to guess' do
      guess = Guess.new("quit")

      expect(guess.quit?).to eq(true)
    end

    it 'returns false if anything but quit is passed' do
      guess = Guess.new("i don't want to play anymore")

      expect(guess.quit?).to eq(false)
    end
  end

  describe '#restart?' do
    it 'returns true if "restart" is passed' do
      guess = Guess.new("restart")

      expect(guess.restart?).to eq(true)
    end

    it 'returns false if anything but restart is passed' do
      guess = Guess.new("can we play again?")

      expect(guess.restart?).to eq(false)
    end
  end
end
