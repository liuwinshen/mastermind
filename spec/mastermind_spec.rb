require_relative '../lib/mastermind'

RSpec.describe Mastermind do
  !let(:game) { Mastermind.new }

  it "prints game instructions" do
    expect {game.print_instructions}.to output(/After each guess/).to_stdout
  end

  it "counts the number of each color in a given code" do
    expect(game.color_count(["R", "O", "Y", "G"])).to eq ({:R => 1, :O => 1, :Y => 1, :G => 1})
    expect(game.color_count(["P", "P", "P", "P"])).to eq ({:P => 4})
    expect(game.color_count(["R", "O", "B", "R", "B", "B"])).to eq ({:R => 2, :O => 1, :B => 3})
  end

  xit "counts how many colors in the guess match the code" do
    expect(game.compare(["R", "O", "Y", "G"], "RROO")).to eq (2)
  end
end
