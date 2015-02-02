module StringCalculator

  def self.add(string)
    string.split(",").inject(0) { |sum, num| sum += num.to_i }
  end

end
