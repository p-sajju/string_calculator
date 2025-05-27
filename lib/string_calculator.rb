class StringCalculator
    def self.add(numbers)
      return 0 if numbers.strip.empty?
  
      delimiters = /[\n,]/ # default
  
      if numbers.start_with?("//")
        header, numbers = numbers.split("\n", 2)
  
        if header.include?("[")
          # Supports multiple or long delimiters
          custom_delimiters = header.scan(/\[(.*?)\]/).flatten
          pattern = custom_delimiters.map { |d| Regexp.escape(d) }.join("|")
          delimiters = Regexp.new(pattern)
        else
          # Single-character delimiter
          delimiters = Regexp.new(Regexp.escape(header[2]))
        end
      end
  
      tokens = numbers.split(delimiters).map(&:to_i)
  
      negatives = tokens.select { |n| n < 0 }
      raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  
      tokens.reject { |n| n > 1000 }.sum
    end
end
