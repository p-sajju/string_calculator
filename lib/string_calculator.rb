# string_calculator.rb
class StringCalculator
	def self.add(numbers)
		return 0 if numbers.empty?
        if numbers.start_with?("//")
            if numbers =~ %r{//\[(.+?)\]\n(.*)}
                delimiter = Regexp.escape($1)
                numbers = $2
                nums = numbers.split(/#{delimiter}/).map(&:to_i)
            else
                delimiter, numbers = numbers.match(%r{//(.)\n(.*)})[1, 2]
                nums = numbers.split(delimiter).map(&:to_i)
            end
        else
            nums = numbers.split(/[\n,]/).map(&:to_i)
        end

        negatives = nums.select { |n| n < 0 }
        raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

        nums.reject { |n| n > 1000 }.sum
	end
end
