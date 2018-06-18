require_relative './mastermind'

RSpec.describe Mastermind do
  game = Mastermind.new
  code = game.generate_code

  it "prints game instructions" do
    expect { game.print_instructions }.to output(/Welcome to Mastermind!/).to_stdout
  end

  it "generates a random code of length 4" do
    expect(code.length).to eq (4)
  end

  it "generates a code using at least one of the possible colors" do
    code.each do |char|
      expect(["R", "O", "Y", "G", "B", "P"].include?(char)).to eq(true)
    end
  end

  it "generates a different code each time" do
    code2 = game.generate_code
    expect(code.object_id != code2.object_id).to eq (true)
  end

  it "takes in user input" do
    expect(game.input_guess).not_to eq (nil)
  end

  # it "only allows letters in input" do
  #   expect(game.input_guess)
  # end
end
