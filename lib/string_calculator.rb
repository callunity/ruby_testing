module StringCalculator

  def self.add(string)
    delimiter, string = self.set_delimiter(string)
    string.gsub!("\n", delimiter)
    string.split(delimiter).inject(0) { |sum, num| sum += num.to_i }
  end

  def self.set_delimiter(string)
    delimiter = ","
    if string[0..1] == "//"
      delimiter = string[2]
      string = string[3..-1]
    end
    return delimiter, string
  end

end
