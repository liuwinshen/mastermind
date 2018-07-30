require_relative '../lib/guess_validator'

RSpec.describe GuessValidator do
  let(:input) { text }
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
      let(:text) { 'R' }

      it 'appends an error message to error' do
        expect(validator.validate(input)).to eq(["Your guess is too short. Please enter 4 letters."])
      end
    end

    context 'when input is too long' do
      let(:text) { 'ROYGBP' }

      it 'appends an error message to error' do
        expect(validator.validate(input)).to eq(["Your guess is too long. Only 4 letters are allowed."])
      end
    end

    context 'when input has characters that are invalid colors' do
      let(:text) { 'AWFS' }

      it 'appends an error message to error' do
        expect(validator.validate(input)).to eq(["Your guess has invalid colors. Please use only [\"R\", \"O\", \"Y\", \"G\", \"B\", \"P\"]."])
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
end
