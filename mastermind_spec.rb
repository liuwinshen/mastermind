require_relative './mastermind'

RSpec.describe Mastermind do
  game = Mastermind.new
  it "prints game instructions" do
    expect { game.print_instructions }.to output(/Welcome to Mastermind!/).to_stdout
  end

  it "generates a random code of length 4" do
    code = game.generate_code
    expect(code.length).to eq (4)
  end

  it "generates a random code of 4 colors" do
    code = game.generate_code
    code.each do |color|
      expect(color).to be_in(["R", "O", "Y", "G", "B", "P"])
    end
  end
end
