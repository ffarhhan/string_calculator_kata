require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end
    it "returns sum of two comma-separated numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end
    it "returns sum of multiple comma-separated numbers" do
      expect(StringCalculator.add("1,2,3,4")).to eq(10)
    end
    it "handles newline as valid delimiter" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end
    it "supports custom delimiters using // syntax" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end
    it "raises an error for negative numbers" do
      expect { StringCalculator.add("1,-2,-3,4") }
        .to raise_error("negative numbers not allowed -2,-3")
    end
  end
end