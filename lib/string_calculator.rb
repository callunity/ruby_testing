module StringCalculator

  def self.add(string)
    if string[0..1] == "//"
      delimiter = string[2]
      string.gsub!(delimiter, ",")
      puts delimiter
      puts string
    end
    string.gsub!("\n", ",")
    string.split(",").inject(0) { |sum, num| sum += num.to_i }
  end

end
