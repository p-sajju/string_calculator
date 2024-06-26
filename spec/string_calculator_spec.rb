# string_calculator_spec.rb
require 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(calculator.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers separated by comma' do
      expect(calculator.add("1,2")).to eq(3)
    end

    it 'handles new lines between numbers' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'throws exception for negative numbers' do
      expect { calculator.add("1,-2,3,-4") }.to raise_error(RuntimeError, "Negatives not allowed: -2, -4")
    end

    it 'ignores numbers larger than 1000' do
      expect(calculator.add("2,1001")).to eq(2)
    end
  end
end