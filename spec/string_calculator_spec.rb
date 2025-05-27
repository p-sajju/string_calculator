# spec/string_calculator_spec.rb
require 'spec_helper'
require 'string_calculator'
require 'minitest/autorun'

class StringCalculatorTest < Minitest::Test
  def test_empty_string_returns_zero
    assert_equal 0, StringCalculator.add("")
  end
end
