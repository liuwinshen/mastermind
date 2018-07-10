require_relative '../lib/guess'
require_relative '../lib/guess_validator'

RSpec.describe GuessValidator do
  let(:guess) { Guess.new(text) }
  let(:validator) { GuessValidator.new }

  describe '#validate' do
    context 'when input contains numbers' do
      let(:text) { "ROY1" }

      it 'populates errors with new error' do
        expect(validator.validate(guess)).to eq(["Numbers are not allowed."])
      end
    end

    context 'when input contains punctuation' do
      let(:text) { "Y!@R" }

      it 'populates errors with punctuation error' do
        expect(validator.validate(guess)).to eq(["Punctuation is not allowed."])
      end
    end

    context 'when input is too short' do
      let(:text) { 'r' }

      it 'appends an error message to error' do
        expect(validator.validate(guess)).to eq(["Your guess is too short. Please enter 4 letters."])
      end
    end

    context 'when input is too long' do
      let(:text) { 'roygbp' }

      it 'appends an error message to error' do
        expect(validator.validate(guess)).to eq(["Your guess is too long. Only 4 letters are allowed."])
      end
    end

    context 'when the input has characters that are invalid colors' do
      let(:text) { 'awfs' }

      it 'appends an error message to error' do
        expect(validator.validate(guess)).to eq(["Your guess has invalid colors. Please use only available colors."])
      end
    end

    context 'when inputs has both numbers and punctuation' do
      let(:text) { "R!2" }

      it 'appends several error messages to errors' do
        expect(validator.validate(guess)).to eq([
          "Numbers are not allowed.",
          "Punctuation is not allowed.",
          "Your guess is too short. Please enter 4 letters."
        ])
      end
    end

    context 'when input has numbers and invalid colors' do
      let(:text) { "QZ2A" }

      it 'does not append invalid color messge to errors' do
        expect(validator.validate(guess)).to_not include("Your guess has invalid colors. Please use only available colors.")
      end
    end

    context 'when input has puntuation and invalid colors' do
      let(:text) { "AO,Y" }

      it 'does not append invalid color message to errors' do
        expect(validator.validate(guess)).to_not include("Your guess has invalid colors. Please use only available colors.")
      end
    end

    context 'when input has only valid colors' do
      let(:text) { "ROYG" }

      it 'does not append any messages to errors' do
        expect(validator.validate(guess)).to eq([])
      end
    end
  end

  describe '#valid?' do
    context 'when not validated' do
      let(:text) { "abc12" }

      it 'raises error' do
        expect{validator.valid?}.to raise_exception(Exception, 'Must run #validate! before calling #valid?')
      end
    end

    context 'when validated and input is valid' do
      let(:text) { "RORO" }

      it 'returns true' do
        validator.validate!

        expect(validator.valid?).to eq(true)
      end
    end

    context 'when validated and input is invalid' do
      let(:text) { "abc12" }

      it 'returns false' do
        validator.validate!

        expect(validator.valid?).to eq(false)
      end
    end
  end
end
