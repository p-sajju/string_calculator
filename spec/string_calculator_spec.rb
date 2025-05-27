# spec/string_calculator_spec.rb
require 'spec_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it "returns the number itself for a single number" do
        expect(StringCalculator.add("5")).to eq(5)
    end

    it "returns the sum of two comma-separated numbers" do
        expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "returns the sum of an unknown amount of comma-separated numbers" do
        expect(StringCalculator.add("1,2,3,4")).to eq(10)
    end
    
    it "supports newlines as valid delimiters along with commas" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
    end
end
