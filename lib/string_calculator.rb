class StringCalculator
  def self.add(input)
    return 0 if input.strip.empty?

    delimiter_pattern = /[\n,]/

    if input.start_with?("//")
      delimiter, input = input.split("\n", 2)
      custom_delimiter = Regexp.escape(delimiter[2..])
      delimiter_pattern = /[\n,#{custom_delimiter}]/
    end

    numbers = input.split(delimiter_pattern).map(&:to_i)

    negatives = numbers.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    numbers.sum
  end
end