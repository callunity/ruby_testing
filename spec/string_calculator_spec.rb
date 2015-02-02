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

  it "returns 201 for string '159, 42'" do
    expect(StringCalculator.add("159,42")).to eq(201)
  end

  # more tests go here
end

