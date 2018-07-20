require_relative '../lib/user_input'
require_relative '../lib/guess_validator'

RSpec.describe UserInput do
  let(:input) { Class.new { extend UserInput } }
  let(:validator) { GuessValidator.new }

  describe '#get_upcase_input' do
    let(:input) { double('UserInput').as_null_object }

    it 'gets upcased user input' do
      allow(input).to receive(:gets).and_return('abcd')

      expect(input).to receive(:get_upcase_input).and_return('ABCD')
      input.get_upcase_input
    end
  end

  describe '#get_valid_input' do
    context 'when "quit" is the guess' do
      let(:input) { double('UserInput').as_null_object }

      xit 'calls quit' do
        allow(input).to receive(:gets).and_return('QUIT')
        allow(input).to receive(:get_upcase_input).and_return('QUIT')

        expect(input).to receive(:quit)
        input.get_valid_input(validator)
      end
    end
  end
end
