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
  end
end