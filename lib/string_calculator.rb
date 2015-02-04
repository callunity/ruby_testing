module StringCalculator

  def self.add(string)
    delimiter, string = self.set_delimiter(string)
    negatives = []
    string.gsub!("\n", delimiter)
    result = string.split(delimiter).map {|num| num if num.length < 4}
    answer = result.compact.inject(0) do |sum, num|
      negatives << num if num.to_i < 0
      sum += num.to_i
    end

    if negatives.length > 1
      raise "Cannot handle negative numbers: #{negatives.join(',')}"
    elsif negatives.length == 1
      raise
    else
      answer
    end
  end

  def self.set_delimiter(string)
    delimiter = ","
    if string[0..1] =~ /\/\//
      delimiter = string[2]
      string = string[3..-1]
    end
    return delimiter, string
  end

end
