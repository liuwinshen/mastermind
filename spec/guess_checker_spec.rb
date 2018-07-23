require_relative '../lib/guess_checker'

RSpec.describe GuessChecker do
  let(:checker) { GuessChecker.new("RGYO") }

  describe "#check_red" do
    context "when guess matches some colors in code" do
      it "returns 2 red pins for repeated colors" do
        expect(checker.check_red("RRRR", "RROO")).to eq(2)
      end

      it "leaves original code unchanged" do
        checker.check_red("ROYG", "RGYO")
        expect(checker.original_code).to eq("RGYO")
      end

      it "returns 3 red pins for different colors" do
        expect(checker.check_red("ROYG", "ROYB")).to eq(3)
      end
    end

    context "when guess matches no colors in code" do
      it "returns zero" do
        expect(checker.check_red("ROYG", "BPBP")).to eq (0)
      end
    end
  end

  describe "#check_white" do
    context "when guess matches some colors in code" do
      it "returns 1 white pin for single color match" do
        expect(checker.check_white("ROYG", "BBPR")).to eq(1)
      end

      it "guess has higher frequency of color than code" do
        expect(checker.check_white("BBPP", "BGOR")).to eq(1)
      end

      it "guess has lower frequency of color than code" do
        expect(checker.check_white("-BPP", "-GBB")).to eq(1)
      end

      it "ignores dashes and returns 1" do
        expect(checker.check_white("--RP", "--PO")).to eq(1)
      end

      it "leaves original code unchanged" do
        checker.check_white("-O-G", "-G-O")
        expect(checker.original_code).to eq("RGYO")
      end
    end

    context "when guess matches no colors in code" do
      it "returns zero" do
        expect(checker.check_white("ROYG", "BPBP")).to eq (0)
      end
    end
  end

  describe "#get_feedback" do
    context "when guess matches colors in code" do
      it "returns 2 red pins" do
        checker.get_feedback("ROYG")
        expect(checker.pins[:red]).to eq(2)
      end

      it "leaves original code unchanged" do
        checker.get_feedback("ROYG")
        expect(checker.original_code).to eq("RGYO")
      end

      it "returns 2 white pins" do
        checker.get_feedback("ROYG")
        expect(checker.pins[:white]).to eq (2)
      end
    end

    context "all matched colors are in the right position" do
      it "returns 3 red pins" do
        checker.get_feedback("RGYB")
        expect(checker.pins[:red]).to eq (3)
      end

      it "returns no white pins" do
        checker.get_feedback("---B")
        expect(checker.pins[:white]).to eq (0)
      end
    end
  end
end
