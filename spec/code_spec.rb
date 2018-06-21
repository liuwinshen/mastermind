require_relative '../lib/code'

RSpec.describe Code do
  let(:colors) { Code.new.colors }
  let(:game_code) { Code.generate(colors) }

  describe "#generate" do
    context "when generating code"
      it "has length 4" do
        expect(game_code.length).to eq (4)
      end

      it "uses only available colors" do
        game_code.each do |char|
          expect(["R", "O", "Y", "G", "B", "P"].include?(char)).to eq(true)
        end
      end
  end
end
