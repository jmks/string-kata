#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'string_calculator'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe StringCalculator, "#add" do

  it "returns 0 for empty string" do
    expect(StringCalculator.add("")).to eql(0)
  end

  it "returns 0 for '0'" do 
    expect(StringCalculator.add("0")).to eql 0
  end

  it "returns 5 for '5'" do 
    expect(StringCalculator.add("5")).to eql 5
  end

  it "returns 3 for '1,2'" do 
    expect(StringCalculator.add("1,2")).to eql 3
  end

  it "returns 16 for '7,9'" do 
    expect(StringCalculator.add("7,9")).to eql 16
  end
end
