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
end
