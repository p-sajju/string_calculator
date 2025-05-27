# spec/string_calculator_spec.rb
require 'spec_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it "returns the number itself for a single number" do
        calculator = StringCalculator.new
        expect(calculator.add("5")).to eq(5)
    end
end
