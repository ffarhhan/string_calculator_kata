class StringCalculator
  def self.add(input)
    return 0 if input == ""

    if input.start_with?("//")
      delimiter, input = input.split("\n", 2)
      delimiter = delimiter[2..]
      numbers = input.split(/[\n,#{Regexp.escape(delimiter)}]/).map(&:to_i)
    else
      numbers = input.split(/[\n,]/).map(&:to_i)
    end

    negatives = numbers.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    numbers.sum
  end
end