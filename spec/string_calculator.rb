class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?
  
      delimiter = find_delimiter(numbers)
      numbers = extract_numbers(numbers, delimiter)
  
      negatives = numbers.select { |num| num < 0 }
      raise "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  
      numbers.sum
    end
  
    private
  
    def find_delimiter(numbers)
      delimiter_match = numbers.match(/^\/\/(\[?.*?\]?)\n/)
      delimiter_match ? parse_delimiter(delimiter_match[1]) : ','
    end
  
    def parse_delimiter(delimiter_str)
      delimiters = delimiter_str.scan(/\[([^\[\]]+)\]/).flatten
      delimiters.empty? ? delimiter_str : Regexp.union(delimiters.map { |d| Regexp.escape(d) })
    end
  
    def extract_numbers(numbers, delimiter)
      numbers.gsub(/^\/\/.*?\n/, '').split(/#{delimiter}|\n/).map(&:to_i).reject { |num| num > 1000 }
    end
  end