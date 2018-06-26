require_relative '../lib/code'

RSpec.describe Code do
  let(:secret_code) { Code.generate }

  it "generates a random code of length 4" do
    expect(secret_code.length).to eq (4)
  end

  it "generates a code using at least one of the possible colors" do
    secret_code.each do |char|
      expect(["R", "O", "Y", "G", "B", "P"].include?(char)).to eq(true)
    end
  end
end
