#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'string_calculator'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe StringCalculator, "#add" do

  it "returns 0 for empty string" do
    expect(StringCalculator.add("")).to eq(0)
  end

  it "returns 5 for string '5'" do
    expect(StringCalculator.add("5")).to eq(5)
  end

  it "returns 3 for string '1,2'" do
    expect(StringCalculator.add("1,2")).to eq(3)
  end

  it "returns 201 for string '159,42'" do
    expect(StringCalculator.add("159,42")).to eq(201)
  end

  it "returns 4002 for string '1558,2,2442'" do
    expect(StringCalculator.add("1558,2,2442")).to eq(2) #due to elimination of n > 1001 in requirement 9
  end

  it "returns 6 for string '1\n2,3'" do
    expect(StringCalculator.add("1\n2,3")).to eq(6)
  end

  it "returns 7 for string '//;\n2;5'" do
    expect(StringCalculator.add("//[;]\n2;5")).to eq(7)
  end

  it "returns 10 for string '//@\n2@5@3'" do
    expect(StringCalculator.add("//[@]\n2@5@3")).to eq(10)
  end

  it "raises an error when string includes one negative ex. '//;\n2;5;-3" do
    expect { StringCalculator.add("//[;]\n2;5;-2") }.to raise_error
  end

  it "raises a custom error when string includes more than one negative '//;\n-2;-3;5'" do
    expect { StringCalculator.add("//[;]\n-2;-3;5") }.to raise_error "Cannot handle negative numbers: -2,-3"
  end

  it "ignores numbers larger than 100 ex. string '//[$]10$1001$103'" do
    expect(StringCalculator.add("//[$]10$1001$103")).to eq(113)
  end

  it "returns 7 for string '//[whyyy]2whyyy5'" do
    expect(StringCalculator.add("//[whyyy]2whyyy5")).to eq(7)
  end

  # more tests go here
end

