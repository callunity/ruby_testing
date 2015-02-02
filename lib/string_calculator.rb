module StringCalculator

  def self.add(string)
    delimiter, string = self.set_delimiter(string)
    string.split(delimiter).inject(0) do |sum, num|
      if num.to_i > 0
        sum += num.to_i
      else
        raise "Cannot handle #{num.to_i} negatives "
      end
    end
  end

  def self.set_delimiter(string)
    delimiter = /[,\n]/
    if string[0..1] == "//"
      delimiter = string[2]
      string = string[3..-1]
    end
    return delimiter, string
  end

end
