# String Calculator (Ruby)

This is a simple Ruby implementation of a **String Calculator**, built incrementally using **TDD** (Test-Driven Development) with **RSpec**.

The `StringCalculator.add` method takes a string of numbers separated by delimiters and returns their sum. It supports various features like custom delimiters, newlines, multiple delimiters, and more.

---

## Features

- Add numbers separated by commas or newlines
- Support custom single-character delimiters (e.g., `//;\n1;2`)
- Handle multiple or unknown numbers
- Support delimiters of any length (e.g., `//[***]\n1***2***3`)
- Support multiple custom delimiters (e.g., `//[*][%]\n1*2%3`)
- Ignore numbers > 1000
- Raise exception for negative numbers with details

---

## Example Usage

```ruby
require_relative 'string_calculator'

StringCalculator.add("")                     # => 0
StringCalculator.add("1,2")                  # => 3
StringCalculator.add("1\n2,3")               # => 6
StringCalculator.add("//;\n1;2")             # => 3
StringCalculator.add("//[***]\n1***2***3")   # => 6
StringCalculator.add("//[*][%]\n1*2%3")      # => 6
