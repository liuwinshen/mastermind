require_relative '../lib/code'

RSpec.describe CodeGenerator do
  let(:code) { CodeGenerator.new }

  describe "#initialize" do
    it "creates code of length 4" do
      expect(code.secret_code.length).to eq (4)
    end

    it "uses only available colors" do
      code.secret_code.split("").each do |char|
        expect(["R", "O", "Y", "G", "B", "P"].include?(char)).to eq(true)
      end
    end
  end
end
