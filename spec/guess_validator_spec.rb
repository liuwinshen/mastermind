require_relative '../lib/user_input'
require_relative '../lib/guess_validator'

RSpec.describe GuessValidator do
  let(:input) { UserInput.new(text).content }
  let(:validator) { GuessValidator.new }

  describe '#validate' do
    context 'when input contains numbers' do
      let(:text) { "ROY1" }

      it 'populates errors with new error' do
        expect(validator.validate(input)).to eq(["Numbers are not allowed."])
      end
    end

    context 'when input contains punctuation' do
      let(:text) { "Y!@R" }

      it 'populates errors with punctuation error' do
        expect(validator.validate(input)).to eq(["Punctuation is not allowed."])
      end
    end

    context 'when input contains only punctuation' do
      let(:text) { "#!@$" }

      it 'populates errors with punctuation error' do
        expect(validator.validate(input)).to eq(["Punctuation is not allowed."])
      end
    end

    context 'when input is too short' do
      let(:text) { 'r' }

      it 'appends an error message to error' do
        expect(validator.validate(input)).to eq(["Your guess is too short. Please enter 4 letters."])
      end
    end

    context 'when input is too long' do
      let(:text) { 'roygbp' }

      it 'appends an error message to error' do
        expect(validator.validate(input)).to eq(["Your guess is too long. Only 4 letters are allowed."])
      end
    end

    context 'when input has characters that are invalid colors' do
      let(:text) { 'awfs' }

      it 'appends an error message to error' do
        expect(validator.validate(input)).to eq(["Your guess has invalid colors. Please use only available colors."])
      end
    end

    context 'when input has both numbers and punctuation and is too short' do
      let(:text) { "R!2" }

      it 'appends several error messages to errors' do
        expect(validator.validate(input)).to eq([
          "Numbers are not allowed.",
          "Punctuation is not allowed.",
          "Your guess is too short. Please enter 4 letters."
        ])
      end
    end

    context 'when input has punctuation and is too long' do
      let(:text) { "R!#WE" }

      it 'appends several error messages to errors' do
        expect(validator.validate(input)).to eq([
          "Punctuation is not allowed.",
          "Your guess is too long. Only 4 letters are allowed."
        ])
      end
    end

    context 'when input has numbers and invalid colors' do
      let(:text) { "QZ2A" }

      it 'does not append invalid color messge to errors' do
        expect(validator.validate(input)).to_not include("Your guess has invalid colors. Please use only available colors.")
      end
    end

    context 'when input has punctuation and invalid colors' do
      let(:text) { "AO,Y" }

      it 'does not append invalid color message to errors' do
        expect(validator.validate(input)).to_not include("Your guess has invalid colors. Please use only available colors.")
      end
    end

    context 'when input has only valid colors' do
      let(:text) { "ROYG" }

      it 'does not append any messages to errors' do
        expect(validator.validate(input)).to eq([])
      end
    end
  end

  describe '#valid?' do
    context 'when validated and input is valid' do
      let(:text) { "RORO" }

      it 'returns true' do
        expect(validator.valid?(input)).to eq(true)
      end
    end

    context 'when validated and input is invalid' do
      let(:text) { "abc12" }

      it 'returns false' do
        expect(validator.valid?(input)).to eq(false)
      end
    end
  end
end
